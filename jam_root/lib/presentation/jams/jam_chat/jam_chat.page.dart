import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/widgets/widgets.dart';
import 'package:faker/faker.dart';
import 'package:jam_utils/jam_utils.dart';

class JamChatPage extends HookConsumerWidget {
  const JamChatPage({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sentMessages = useState(
      List<MessageModel>.generate(
        100,
        (index) => MessageModel(
          sentAt: DateTime.now(),
          fromMe: random.boolean(),
          messageText:
              faker.lorem.sentences(random.integer(5, min: 1)).join(''),
        ),
      ),
    );

    final user = ref.watch(userStateProvider).getLastValue();

    return ChatWrapper(
      jam: jam,
      child: Scaffold(
        appBar: ChatBarBase(
          avatar: CircleAvatar(
            backgroundImage: NetworkImage(
              jam.backgroundUrlWithPlaceholder,
            ),
          ),
          bodyWidgets: [
            Text(
              jam.name,
              style: context.jText.bodySmall,
            ),
            Text(
              '${jam.participants.length} participants',
              style: context.jText.bodySmall,
            ),
          ],
          popupMenu: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (c, i) {
                  final messageModel = sentMessages.value[i];

                  final sender = jam.participants.random;
                  final messageUser = messageModel.fromMe ? user : sender;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Align(
                        alignment: messageModel.fromMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: MessageBoxBase(
                          message: messageModel,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                ),
                                child: Row(
                                  children: [
                                    HeroAvatar(
                                      tag: 'user-$i',
                                      profile: messageUser,
                                      radius: 12,
                                      onTap: () => messageModel.fromMe
                                          ? {}
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (ctx) =>
                                                    OtherUserProfilePage(
                                                  viewedUserId: sender.id,
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      messageUser.fullName,
                                      style: context.jText.bodySmall?.copyWith(
                                        color: context.jColor.tertiary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                messageModel.messageText ?? '',
                                style: context.jText.bodySmall,
                              ),
                              const SizedBox(height: 6),
                              MessageBoxMetaInfo(message: messageModel)
                            ],
                          ),
                        )),
                  );
                },
                itemCount: sentMessages.value.length,
              ),
            ),
            ChatInputBarBase(
              chatId: -1,
              jam: jam,
              onSend: (v) => sentMessages.value = [
                MessageModel(
                  sentAt: DateTime.now(),
                  fromMe: true,
                  messageText: v,
                ),
                ...sentMessages.value,
              ],
            )
          ],
        ),
      ),
    );
  }
}
