import 'package:jam/config/aliases/models.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/communication/mixins/chatting_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

part 'messages_state.g.dart';

class MessagesState with ChattingProviders, Storer {
  MessagesState(this._ref);

  final ProviderRef _ref;

  final _messagesState = BehaviorSubject<Messages>.seeded([]);

  Stream<Messages> messages$({required ChatModel chat}) async* {
    _ref.read(messagesRepositoryProvider).getMessages$(chat: chat).listen(
      (event) {
        _messagesState.value = event;
        // the rest will be loaded by lazy loading
        localDatabase.put(
          'chat-messages-${chat.id}',
          event.take(50).toList(),
        );
      },
    );

    yield* _messagesState.stream.asBroadcastStream();
  }
}

@riverpod
class MessagesStateNotifier extends _$MessagesStateNotifier {
  @override
  FutureOr<Messages> build({required ChatModel chat}) {
    ref
        .read(messagesRepositoryProvider)
        .getMessages$(chat: chat)
        .listen((event) {
      state = AsyncData(event);

      localDatabase.put('chat-messages-${chat.id}', event);
    });

    return [];
  }
}

final messagesStateProvider = Provider<MessagesState>(
  (ref) => MessagesState(ref),
);

final messages$ = StreamProvider.family<Messages, ChatModel>(
  (ref, chat) => ref.watch(messagesStateProvider).messages$(chat: chat),
);
