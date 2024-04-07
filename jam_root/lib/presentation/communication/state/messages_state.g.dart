// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesStateNotifierHash() =>
    r'b3fafe9cc07c3f4986091c4cc63cc276176a2b80';

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

abstract class _$MessagesStateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Messages> {
  late final ChatModel chat;

  FutureOr<Messages> build({
    required ChatModel chat,
  });
}

/// See also [MessagesStateNotifier].
@ProviderFor(MessagesStateNotifier)
const messagesStateNotifierProvider = MessagesStateNotifierFamily();

/// See also [MessagesStateNotifier].
class MessagesStateNotifierFamily extends Family<AsyncValue<Messages>> {
  /// See also [MessagesStateNotifier].
  const MessagesStateNotifierFamily();

  /// See also [MessagesStateNotifier].
  MessagesStateNotifierProvider call({
    required ChatModel chat,
  }) {
    return MessagesStateNotifierProvider(
      chat: chat,
    );
  }

  @override
  MessagesStateNotifierProvider getProviderOverride(
    covariant MessagesStateNotifierProvider provider,
  ) {
    return call(
      chat: provider.chat,
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
  String? get name => r'messagesStateNotifierProvider';
}

/// See also [MessagesStateNotifier].
class MessagesStateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MessagesStateNotifier,
        Messages> {
  /// See also [MessagesStateNotifier].
  MessagesStateNotifierProvider({
    required ChatModel chat,
  }) : this._internal(
          () => MessagesStateNotifier()..chat = chat,
          from: messagesStateNotifierProvider,
          name: r'messagesStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagesStateNotifierHash,
          dependencies: MessagesStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              MessagesStateNotifierFamily._allTransitiveDependencies,
          chat: chat,
        );

  MessagesStateNotifierProvider._internal(
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
  FutureOr<Messages> runNotifierBuild(
    covariant MessagesStateNotifier notifier,
  ) {
    return notifier.build(
      chat: chat,
    );
  }

  @override
  Override overrideWith(MessagesStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagesStateNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MessagesStateNotifier, Messages>
      createElement() {
    return _MessagesStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesStateNotifierProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessagesStateNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Messages> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _MessagesStateNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MessagesStateNotifier,
        Messages> with MessagesStateNotifierRef {
  _MessagesStateNotifierProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as MessagesStateNotifierProvider).chat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
