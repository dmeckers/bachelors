import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class ChatStateStateNotifier
    extends StateNotifier<({ChatState? state, int chatId})> {
  ChatStateStateNotifier(super.state, {required this.chatCache});

  final ChatCache chatCache;

  void updateChatInputMode(ChatInputMode inputMode,
      [MessageModel? messageModel]) {
    final (state: chatState, chatId: id) = state;

    state = (
      state: chatState?.copyWith(inputMode: inputMode, model: messageModel) ??
          ChatState(inputMode: inputMode, model: messageModel),
      chatId: id
    );

    if (inputMode == ChatInputMode.reply) {
      chatCache.cacheDraftMessage(chatId: state.chatId, state: state.state!);
    }
  }

  void updateMessageDraft(String? messageDraft) {
    final (state: chatState, chatId: id) = state;
    if (skipNextHit) {
      skipNextHit = false;
      return;
    }

    if (messageDraft?.isEmpty ?? true) return;

    state = (
      state: chatState?.copyWith(messageDraft: messageDraft) ??
          ChatState(messageDraft: messageDraft),
      chatId: id
    );
    if ((state.state?.messageDraft?.isNotEmpty ?? false)) {
      chatCache.cacheDraftMessage(chatId: state.chatId, state: state.state!);
    }
  }

  void setStandartInputMode() {
    final (state: chatState, chatId: id) = state;

    state = (
      state:
          chatState?.copyWith(inputMode: ChatInputMode.standart, model: null) ??
              const ChatState(inputMode: ChatInputMode.standart, model: null),
      chatId: id
    );

    chatCache.clearCachedDraftMessage(state.chatId);
  }

  var skipNextHit = false;

  void clear() {
    skipNextHit = true;
    state = (
      state: const ChatState(inputMode: ChatInputMode.standart, model: null),
      chatId: state.chatId
    );
    chatCache.clearCachedDraftMessage(state.chatId);
  }
}
