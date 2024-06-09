import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class InviteFriendPage extends HookConsumerWidget {
  const InviteFriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionStatus = useState<PermissionStatus?>(null);
    final contacts = useState(<Contact>[]);

    Future<void> navigateToNativeSmsSender() async {
      if (!await launchUrl(Uri(
        scheme: 'sms',
        //need to get real number
        path: '5550101234',
        queryParameters: {
          'body': 'Hi there! I\'m using Jam! Join me at https://jam.com ',
        },
      ))) {
        throw Exception('Could not launch sms:5550101234');
      }
    }

    Future<void> fetchContacts({
      required ValueNotifier<List<Contact>> contactsNotifier,
    }) async {
      final contacts = await FlutterContacts.getContacts();
      contactsNotifier.value = contacts;
    }

    Future<void> requestPermission({
      required ValueNotifier<PermissionStatus?> permissionNotifier,
    }) async {
      final status = await Permission.contacts.request();
      permissionNotifier.value = status;

      if (status.isGranted) fetchContacts(contactsNotifier: contacts);
    }

    useEffect(() {
      requestPermission(permissionNotifier: permissionStatus);
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Invite Friend',
          style: context.jText.bodyMedium
              ?.copyWith(color: context.jTheme.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () => debugPrint('search'),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: permissionStatus.value == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildShareButton(),
                  _buildContactsHeadline(context),
                  permissionStatus.value!.isGranted
                      ? _buildContactList(
                          context,
                          contacts,
                          navigateToNativeSmsSender,
                        )
                      : const JamErrorBox(
                          errorMessage:
                              'Could not fetch contacts.Permission denied',
                        ),
                ],
              ),
            ),
    );
  }

  ConstrainedBox _buildContactList(
    BuildContext context,
    ValueNotifier<List<Contact>> contacts,
    Future<void> Function() navigateToNativeSmsSender,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: ListView.builder(
        itemCount: contacts.value.length,
        itemBuilder: (context, index) => ShakesOnNoLongPress(
          child: ListTile(
            onTap: navigateToNativeSmsSender,
            leading: CircleAvatar(
              child: contacts.value[index].photo != null
                  ? Image.memory(contacts.value[index].photo!)
                  : const Icon(Icons.person),
            ),
            title: Text(contacts.value[index].displayName),
            subtitle: Text(
              contacts.value[index].phones.isNotEmpty
                  ? contacts.value[index].phones.first.number
                  : 'No phone number',
            ),
          ),
        ),
      ),
    );
  }

  Align _buildContactsHeadline(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text('From Contacts',
            textAlign: TextAlign.left, style: context.jText.headlineMedium),
      ),
    );
  }

  ShakesOnNoLongPress _buildShareButton() {
    return ShakesOnNoLongPress(
      child: ListTile(
        onTap: () =>
            Share.share('Check out this cool app called Jam! https://jam.com'),
        leading: const CircleAvatar(child: Icon(Icons.share)),
        title: const Text('Share Jam'),
        subtitle: const Text('Invite friends to join Jam'),
      ),
    );
  }
}
