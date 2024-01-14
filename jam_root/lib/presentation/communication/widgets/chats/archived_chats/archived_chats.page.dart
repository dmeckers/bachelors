import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ArchivedChatsPage extends HookConsumerWidget {
  const ArchivedChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats$ = ref.watch(
      chatStream.select(
        (value) => value.whenData(
          (value) => value.where((element) => element.isArchived),
        ),
      ),
    );

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Archived Chats'),
      body: chats$.maybeWhen(
        data: (data) => data.isNotEmpty
            ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ChatTile(
                  chatModel: data.toList()[index],
                ),
              )
            : _buildNoArchivedChatsFound(context),
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Center _buildNoArchivedChatsFound(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Theme.of(context).brightness == Brightness.dark
                        ? ImagePathConstants.SEARCH_JAR_INVERTED_PATH
                        : ImagePathConstants.SEARCH_JAR_PATH,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'No Archived Chats',
              style: context.jText.headlineMedium?.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
