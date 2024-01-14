// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_background.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatBackgroundHash() => r'3fe33891f0af49b0ce473d3e27ffa2e8358eb0fe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatBackground
    extends BuildlessAutoDisposeAsyncNotifier<File?> {
  late final ChatModel chat;

  FutureOr<File?> build(
    ChatModel chat,
  );
}

/// See also [ChatBackground].
@ProviderFor(ChatBackground)
const chatBackgroundProvider = ChatBackgroundFamily();

/// See also [ChatBackground].
class ChatBackgroundFamily extends Family<AsyncValue<File?>> {
  /// See also [ChatBackground].
  const ChatBackgroundFamily();

  /// See also [ChatBackground].
  ChatBackgroundProvider call(
    ChatModel chat,
  ) {
    return ChatBackgroundProvider(
      chat,
    );
  }

  @override
  ChatBackgroundProvider getProviderOverride(
    covariant ChatBackgroundProvider provider,
  ) {
    return call(
      provider.chat,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatBackgroundProvider';
}

/// See also [ChatBackground].
class ChatBackgroundProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChatBackground, File?> {
  /// See also [ChatBackground].
  ChatBackgroundProvider(
    ChatModel chat,
  ) : this._internal(
          () => ChatBackground()..chat = chat,
          from: chatBackgroundProvider,
          name: r'chatBackgroundProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatBackgroundHash,
          dependencies: ChatBackgroundFamily._dependencies,
          allTransitiveDependencies:
              ChatBackgroundFamily._allTransitiveDependencies,
          chat: chat,
        );

  ChatBackgroundProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chat,
  }) : super.internal();

  final ChatModel chat;

  @override
  FutureOr<File?> runNotifierBuild(
    covariant ChatBackground notifier,
  ) {
    return notifier.build(
      chat,
    );
  }

  @override
  Override overrideWith(ChatBackground Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatBackgroundProvider._internal(
        () => create()..chat = chat,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chat: chat,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatBackground, File?>
      createElement() {
    return _ChatBackgroundProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatBackgroundProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatBackgroundRef on AutoDisposeAsyncNotifierProviderRef<File?> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _ChatBackgroundProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChatBackground, File?>
    with ChatBackgroundRef {
  _ChatBackgroundProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as ChatBackgroundProvider).chat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
