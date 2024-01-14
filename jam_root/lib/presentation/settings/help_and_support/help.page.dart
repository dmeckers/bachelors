import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> navigateToPrivacyPolicy() async {
      if (!await launchUrl(Uri(
        scheme: 'https',
        //need to get real number
        //todo: change this to the real link
        path: 'https://google.com',
      ))) {
        throw Exception('Could not launch sms:5550101234');
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Help',
          style: context.jText.bodyMedium
              ?.copyWith(color: context.jTheme.primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () => debugPrint('search'),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ShakesOnNoLongPress(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.support_agent, color: context.jColor.primary),
              ),
              title: Text('Ask question', style: context.jText.bodyMedium),
              //TODO just navigate to personla route of support (support chat id is unique for every user (or not?))
              // onTap: () => context.pushNamed(ChatRoutes.personalChat.name, pathParameters: ChatRoutes.personalChat.pathParameter),
            ),
          ),
          const JamDivider(),
          ShakesOnNoLongPress(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.security,
                  color: context.jColor.primary,
                ),
              ),
              title: Text('Privacy policy', style: context.jText.bodyMedium),
              onTap: navigateToPrivacyPolicy,
            ),
          ),
          const JamDivider(),
          ShakesOnNoLongPress(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.info, color: context.jColor.primary),
              ),
              title: Text('FAQ', style: context.jText.bodyMedium),
              onTap: () => context.pushNamed(HelpRoutes.faq.name),
            ),
          ),
        ],
      ),
    );
  }
}
