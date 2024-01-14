// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendDeafultTextMessageHash() =>
    r'2d47a0c6930d0c2481d782facc0a915613dc358c';

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

///
/// Api call to send message
///
///
/// Copied from [_sendDeafultTextMessage].
@ProviderFor(_sendDeafultTextMessage)
const _sendDeafultTextMessageProvider = _SendDeafultTextMessageFamily();

///
/// Api call to send message
///
///
/// Copied from [_sendDeafultTextMessage].
class _SendDeafultTextMessageFamily extends Family<AsyncValue<MessageModel>> {
  ///
  /// Api call to send message
  ///
  ///
  /// Copied from [_sendDeafultTextMessage].
  const _SendDeafultTextMessageFamily();

  ///
  /// Api call to send message
  ///
  ///
  /// Copied from [_sendDeafultTextMessage].
  _SendDeafultTextMessageProvider call({
    required MessageModel message,
    required int chatId,
    required UserProfileModel receiver,
  }) {
    return _SendDeafultTextMessageProvider(
      message: message,
      chatId: chatId,
      receiver: receiver,
    );
  }

  @override
  _SendDeafultTextMessageProvider getProviderOverride(
    covariant _SendDeafultTextMessageProvider provider,
  ) {
    return call(
      message: provider.message,
      chatId: provider.chatId,
      receiver: provider.receiver,
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
  String? get name => r'_sendDeafultTextMessageProvider';
}

///
/// Api call to send message
///
///
/// Copied from [_sendDeafultTextMessage].
class _SendDeafultTextMessageProvider
    extends AutoDisposeFutureProvider<MessageModel> {
  ///
  /// Api call to send message
  ///
  ///
  /// Copied from [_sendDeafultTextMessage].
  _SendDeafultTextMessageProvider({
    required MessageModel message,
    required int chatId,
    required UserProfileModel receiver,
  }) : this._internal(
          (ref) => _sendDeafultTextMessage(
            ref as _SendDeafultTextMessageRef,
            message: message,
            chatId: chatId,
            receiver: receiver,
          ),
          from: _sendDeafultTextMessageProvider,
          name: r'_sendDeafultTextMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendDeafultTextMessageHash,
          dependencies: _SendDeafultTextMessageFamily._dependencies,
          allTransitiveDependencies:
              _SendDeafultTextMessageFamily._allTransitiveDependencies,
          message: message,
          chatId: chatId,
          receiver: receiver,
        );

  _SendDeafultTextMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
    required this.chatId,
    required this.receiver,
  }) : super.internal();

  final MessageModel message;
  final int chatId;
  final UserProfileModel receiver;

  @override
  Override overrideWith(
    FutureOr<MessageModel> Function(_SendDeafultTextMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _SendDeafultTextMessageProvider._internal(
        (ref) => create(ref as _SendDeafultTextMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        message: message,
        chatId: chatId,
        receiver: receiver,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MessageModel> createElement() {
    return _SendDeafultTextMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _SendDeafultTextMessageProvider &&
        other.message == message &&
        other.chatId == chatId &&
        other.receiver == receiver;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);
    hash = _SystemHash.combine(hash, receiver.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _SendDeafultTextMessageRef on AutoDisposeFutureProviderRef<MessageModel> {
  /// The parameter `message` of this provider.
  MessageModel get message;

  /// The parameter `chatId` of this provider.
  int get chatId;

  /// The parameter `receiver` of this provider.
  UserProfileModel get receiver;
}

class _SendDeafultTextMessageProviderElement
    extends AutoDisposeFutureProviderElement<MessageModel>
    with _SendDeafultTextMessageRef {
  _SendDeafultTextMessageProviderElement(super.provider);

  @override
  MessageModel get message =>
      (origin as _SendDeafultTextMessageProvider).message;
  @override
  int get chatId => (origin as _SendDeafultTextMessageProvider).chatId;
  @override
  UserProfileModel get receiver =>
      (origin as _SendDeafultTextMessageProvider).receiver;
}

String _$getChatMessagesHash() => r'725ee7069a00a771920fb40f1c59d5575433648e';

///
/// Api call to get stream of messages for specific chat
///
///
/// Copied from [_getChatMessages].
@ProviderFor(_getChatMessages)
const _getChatMessagesProvider = _GetChatMessagesFamily();

///
/// Api call to get stream of messages for specific chat
///
///
/// Copied from [_getChatMessages].
class _GetChatMessagesFamily extends Family<AsyncValue<List<MessageModel>>> {
  ///
  /// Api call to get stream of messages for specific chat
  ///
  ///
  /// Copied from [_getChatMessages].
  const _GetChatMessagesFamily();

  ///
  /// Api call to get stream of messages for specific chat
  ///
  ///
  /// Copied from [_getChatMessages].
  _GetChatMessagesProvider call({
    required ChatModel chat,
  }) {
    return _GetChatMessagesProvider(
      chat: chat,
    );
  }

  @override
  _GetChatMessagesProvider getProviderOverride(
    covariant _GetChatMessagesProvider provider,
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
  String? get name => r'_getChatMessagesProvider';
}

///
/// Api call to get stream of messages for specific chat
///
///
/// Copied from [_getChatMessages].
class _GetChatMessagesProvider
    extends AutoDisposeStreamProvider<List<MessageModel>> {
  ///
  /// Api call to get stream of messages for specific chat
  ///
  ///
  /// Copied from [_getChatMessages].
  _GetChatMessagesProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _getChatMessages(
            ref as _GetChatMessagesRef,
            chat: chat,
          ),
          from: _getChatMessagesProvider,
          name: r'_getChatMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChatMessagesHash,
          dependencies: _GetChatMessagesFamily._dependencies,
          allTransitiveDependencies:
              _GetChatMessagesFamily._allTransitiveDependencies,
          chat: chat,
        );

  _GetChatMessagesProvider._internal(
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
  Override overrideWith(
    Stream<List<MessageModel>> Function(_GetChatMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _GetChatMessagesProvider._internal(
        (ref) => create(ref as _GetChatMessagesRef),
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
  AutoDisposeStreamProviderElement<List<MessageModel>> createElement() {
    return _GetChatMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _GetChatMessagesProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _GetChatMessagesRef on AutoDisposeStreamProviderRef<List<MessageModel>> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _GetChatMessagesProviderElement
    extends AutoDisposeStreamProviderElement<List<MessageModel>>
    with _GetChatMessagesRef {
  _GetChatMessagesProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _GetChatMessagesProvider).chat;
}

String _$clearChatMessagesHash() => r'9f15a38766e55235bd8676452788dbfd34f9775f';

/// See also [_clearChatMessages].
@ProviderFor(_clearChatMessages)
const _clearChatMessagesProvider = _ClearChatMessagesFamily();

/// See also [_clearChatMessages].
class _ClearChatMessagesFamily extends Family<AsyncValue<void>> {
  /// See also [_clearChatMessages].
  const _ClearChatMessagesFamily();

  /// See also [_clearChatMessages].
  _ClearChatMessagesProvider call({
    required int chatId,
    required bool forEveryone,
  }) {
    return _ClearChatMessagesProvider(
      chatId: chatId,
      forEveryone: forEveryone,
    );
  }

  @override
  _ClearChatMessagesProvider getProviderOverride(
    covariant _ClearChatMessagesProvider provider,
  ) {
    return call(
      chatId: provider.chatId,
      forEveryone: provider.forEveryone,
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
  String? get name => r'_clearChatMessagesProvider';
}

/// See also [_clearChatMessages].
class _ClearChatMessagesProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_clearChatMessages].
  _ClearChatMessagesProvider({
    required int chatId,
    required bool forEveryone,
  }) : this._internal(
          (ref) => _clearChatMessages(
            ref as _ClearChatMessagesRef,
            chatId: chatId,
            forEveryone: forEveryone,
          ),
          from: _clearChatMessagesProvider,
          name: r'_clearChatMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clearChatMessagesHash,
          dependencies: _ClearChatMessagesFamily._dependencies,
          allTransitiveDependencies:
              _ClearChatMessagesFamily._allTransitiveDependencies,
          chatId: chatId,
          forEveryone: forEveryone,
        );

  _ClearChatMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
    required this.forEveryone,
  }) : super.internal();

  final int chatId;
  final bool forEveryone;

  @override
  Override overrideWith(
    FutureOr<void> Function(_ClearChatMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _ClearChatMessagesProvider._internal(
        (ref) => create(ref as _ClearChatMessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
        forEveryone: forEveryone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ClearChatMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _ClearChatMessagesProvider &&
        other.chatId == chatId &&
        other.forEveryone == forEveryone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);
    hash = _SystemHash.combine(hash, forEveryone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _ClearChatMessagesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chatId` of this provider.
  int get chatId;

  /// The parameter `forEveryone` of this provider.
  bool get forEveryone;
}

class _ClearChatMessagesProviderElement
    extends AutoDisposeFutureProviderElement<void> with _ClearChatMessagesRef {
  _ClearChatMessagesProviderElement(super.provider);

  @override
  int get chatId => (origin as _ClearChatMessagesProvider).chatId;
  @override
  bool get forEveryone => (origin as _ClearChatMessagesProvider).forEveryone;
}

String _$deleteChatMessageHash() => r'f5cbba79f57037a56e994f725f40254f444462d3';

/// See also [_deleteChatMessage].
@ProviderFor(_deleteChatMessage)
const _deleteChatMessageProvider = _DeleteChatMessageFamily();

/// See also [_deleteChatMessage].
class _DeleteChatMessageFamily extends Family<AsyncValue<void>> {
  /// See also [_deleteChatMessage].
  const _DeleteChatMessageFamily();

  /// See also [_deleteChatMessage].
  _DeleteChatMessageProvider call({
    required MessageModel message,
    required bool forEveryone,
  }) {
    return _DeleteChatMessageProvider(
      message: message,
      forEveryone: forEveryone,
    );
  }

  @override
  _DeleteChatMessageProvider getProviderOverride(
    covariant _DeleteChatMessageProvider provider,
  ) {
    return call(
      message: provider.message,
      forEveryone: provider.forEveryone,
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
  String? get name => r'_deleteChatMessageProvider';
}

/// See also [_deleteChatMessage].
class _DeleteChatMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_deleteChatMessage].
  _DeleteChatMessageProvider({
    required MessageModel message,
    required bool forEveryone,
  }) : this._internal(
          (ref) => _deleteChatMessage(
            ref as _DeleteChatMessageRef,
            message: message,
            forEveryone: forEveryone,
          ),
          from: _deleteChatMessageProvider,
          name: r'_deleteChatMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteChatMessageHash,
          dependencies: _DeleteChatMessageFamily._dependencies,
          allTransitiveDependencies:
              _DeleteChatMessageFamily._allTransitiveDependencies,
          message: message,
          forEveryone: forEveryone,
        );

  _DeleteChatMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
    required this.forEveryone,
  }) : super.internal();

  final MessageModel message;
  final bool forEveryone;

  @override
  Override overrideWith(
    FutureOr<void> Function(_DeleteChatMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _DeleteChatMessageProvider._internal(
        (ref) => create(ref as _DeleteChatMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        message: message,
        forEveryone: forEveryone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteChatMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _DeleteChatMessageProvider &&
        other.message == message &&
        other.forEveryone == forEveryone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, forEveryone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _DeleteChatMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `message` of this provider.
  MessageModel get message;

  /// The parameter `forEveryone` of this provider.
  bool get forEveryone;
}

class _DeleteChatMessageProviderElement
    extends AutoDisposeFutureProviderElement<void> with _DeleteChatMessageRef {
  _DeleteChatMessageProviderElement(super.provider);

  @override
  MessageModel get message => (origin as _DeleteChatMessageProvider).message;
  @override
  bool get forEveryone => (origin as _DeleteChatMessageProvider).forEveryone;
}

String _$updateMessageHash() => r'58b3a1bf053d583d78e6542dd18eea06f39fbe9a';

/// See also [_updateMessage].
@ProviderFor(_updateMessage)
const _updateMessageProvider = _UpdateMessageFamily();

/// See also [_updateMessage].
class _UpdateMessageFamily extends Family<AsyncValue<void>> {
  /// See also [_updateMessage].
  const _UpdateMessageFamily();

  /// See also [_updateMessage].
  _UpdateMessageProvider call({
    required MessageModel message,
    required UserProfileModel receiver,
  }) {
    return _UpdateMessageProvider(
      message: message,
      receiver: receiver,
    );
  }

  @override
  _UpdateMessageProvider getProviderOverride(
    covariant _UpdateMessageProvider provider,
  ) {
    return call(
      message: provider.message,
      receiver: provider.receiver,
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
  String? get name => r'_updateMessageProvider';
}

/// See also [_updateMessage].
class _UpdateMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_updateMessage].
  _UpdateMessageProvider({
    required MessageModel message,
    required UserProfileModel receiver,
  }) : this._internal(
          (ref) => _updateMessage(
            ref as _UpdateMessageRef,
            message: message,
            receiver: receiver,
          ),
          from: _updateMessageProvider,
          name: r'_updateMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMessageHash,
          dependencies: _UpdateMessageFamily._dependencies,
          allTransitiveDependencies:
              _UpdateMessageFamily._allTransitiveDependencies,
          message: message,
          receiver: receiver,
        );

  _UpdateMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.message,
    required this.receiver,
  }) : super.internal();

  final MessageModel message;
  final UserProfileModel receiver;

  @override
  Override overrideWith(
    FutureOr<void> Function(_UpdateMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UpdateMessageProvider._internal(
        (ref) => create(ref as _UpdateMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        message: message,
        receiver: receiver,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UpdateMessageProvider &&
        other.message == message &&
        other.receiver == receiver;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, receiver.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _UpdateMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `message` of this provider.
  MessageModel get message;

  /// The parameter `receiver` of this provider.
  UserProfileModel get receiver;
}

class _UpdateMessageProviderElement
    extends AutoDisposeFutureProviderElement<void> with _UpdateMessageRef {
  _UpdateMessageProviderElement(super.provider);

  @override
  MessageModel get message => (origin as _UpdateMessageProvider).message;
  @override
  UserProfileModel get receiver => (origin as _UpdateMessageProvider).receiver;
}

String _$archiveChatHash() => r'4755dbcc9f6ebbf7d577b1948c7f9fd82ac6476f';

/// See also [_archiveChat].
@ProviderFor(_archiveChat)
const _archiveChatProvider = _ArchiveChatFamily();

/// See also [_archiveChat].
class _ArchiveChatFamily extends Family<AsyncValue<void>> {
  /// See also [_archiveChat].
  const _ArchiveChatFamily();

  /// See also [_archiveChat].
  _ArchiveChatProvider call({
    required ChatModel chat,
  }) {
    return _ArchiveChatProvider(
      chat: chat,
    );
  }

  @override
  _ArchiveChatProvider getProviderOverride(
    covariant _ArchiveChatProvider provider,
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
  String? get name => r'_archiveChatProvider';
}

/// See also [_archiveChat].
class _ArchiveChatProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_archiveChat].
  _ArchiveChatProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _archiveChat(
            ref as _ArchiveChatRef,
            chat: chat,
          ),
          from: _archiveChatProvider,
          name: r'_archiveChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$archiveChatHash,
          dependencies: _ArchiveChatFamily._dependencies,
          allTransitiveDependencies:
              _ArchiveChatFamily._allTransitiveDependencies,
          chat: chat,
        );

  _ArchiveChatProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(_ArchiveChatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _ArchiveChatProvider._internal(
        (ref) => create(ref as _ArchiveChatRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ArchiveChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _ArchiveChatProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _ArchiveChatRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _ArchiveChatProviderElement extends AutoDisposeFutureProviderElement<void>
    with _ArchiveChatRef {
  _ArchiveChatProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _ArchiveChatProvider).chat;
}

String _$unarchiveChatHash() => r'b38bd9c069812f25502f6e95a92ea9dc5418ef1c';

/// See also [_unarchiveChat].
@ProviderFor(_unarchiveChat)
const _unarchiveChatProvider = _UnarchiveChatFamily();

/// See also [_unarchiveChat].
class _UnarchiveChatFamily extends Family<AsyncValue<void>> {
  /// See also [_unarchiveChat].
  const _UnarchiveChatFamily();

  /// See also [_unarchiveChat].
  _UnarchiveChatProvider call({
    required ChatModel chat,
  }) {
    return _UnarchiveChatProvider(
      chat: chat,
    );
  }

  @override
  _UnarchiveChatProvider getProviderOverride(
    covariant _UnarchiveChatProvider provider,
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
  String? get name => r'_unarchiveChatProvider';
}

/// See also [_unarchiveChat].
class _UnarchiveChatProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_unarchiveChat].
  _UnarchiveChatProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _unarchiveChat(
            ref as _UnarchiveChatRef,
            chat: chat,
          ),
          from: _unarchiveChatProvider,
          name: r'_unarchiveChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unarchiveChatHash,
          dependencies: _UnarchiveChatFamily._dependencies,
          allTransitiveDependencies:
              _UnarchiveChatFamily._allTransitiveDependencies,
          chat: chat,
        );

  _UnarchiveChatProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(_UnarchiveChatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UnarchiveChatProvider._internal(
        (ref) => create(ref as _UnarchiveChatRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UnarchiveChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UnarchiveChatProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _UnarchiveChatRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _UnarchiveChatProviderElement
    extends AutoDisposeFutureProviderElement<void> with _UnarchiveChatRef {
  _UnarchiveChatProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _UnarchiveChatProvider).chat;
}

String _$pinChatHash() => r'8546144ca3c3730c98ce42aa7b912697d8ccd8fc';

/// See also [_pinChat].
@ProviderFor(_pinChat)
const _pinChatProvider = _PinChatFamily();

/// See also [_pinChat].
class _PinChatFamily extends Family<AsyncValue<void>> {
  /// See also [_pinChat].
  const _PinChatFamily();

  /// See also [_pinChat].
  _PinChatProvider call({
    required ChatModel chat,
  }) {
    return _PinChatProvider(
      chat: chat,
    );
  }

  @override
  _PinChatProvider getProviderOverride(
    covariant _PinChatProvider provider,
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
  String? get name => r'_pinChatProvider';
}

/// See also [_pinChat].
class _PinChatProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_pinChat].
  _PinChatProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _pinChat(
            ref as _PinChatRef,
            chat: chat,
          ),
          from: _pinChatProvider,
          name: r'_pinChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pinChatHash,
          dependencies: _PinChatFamily._dependencies,
          allTransitiveDependencies: _PinChatFamily._allTransitiveDependencies,
          chat: chat,
        );

  _PinChatProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(_PinChatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _PinChatProvider._internal(
        (ref) => create(ref as _PinChatRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PinChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _PinChatProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _PinChatRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _PinChatProviderElement extends AutoDisposeFutureProviderElement<void>
    with _PinChatRef {
  _PinChatProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _PinChatProvider).chat;
}

String _$pinChatsHash() => r'ccc8074d14fc191e80501a08a86d49d6daa5083d';

/// See also [_pinChats].
@ProviderFor(_pinChats)
const _pinChatsProvider = _PinChatsFamily();

/// See also [_pinChats].
class _PinChatsFamily extends Family<AsyncValue<void>> {
  /// See also [_pinChats].
  const _PinChatsFamily();

  /// See also [_pinChats].
  _PinChatsProvider call({
    required List<ChatModel> chats,
  }) {
    return _PinChatsProvider(
      chats: chats,
    );
  }

  @override
  _PinChatsProvider getProviderOverride(
    covariant _PinChatsProvider provider,
  ) {
    return call(
      chats: provider.chats,
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
  String? get name => r'_pinChatsProvider';
}

/// See also [_pinChats].
class _PinChatsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_pinChats].
  _PinChatsProvider({
    required List<ChatModel> chats,
  }) : this._internal(
          (ref) => _pinChats(
            ref as _PinChatsRef,
            chats: chats,
          ),
          from: _pinChatsProvider,
          name: r'_pinChatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pinChatsHash,
          dependencies: _PinChatsFamily._dependencies,
          allTransitiveDependencies: _PinChatsFamily._allTransitiveDependencies,
          chats: chats,
        );

  _PinChatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chats,
  }) : super.internal();

  final List<ChatModel> chats;

  @override
  Override overrideWith(
    FutureOr<void> Function(_PinChatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _PinChatsProvider._internal(
        (ref) => create(ref as _PinChatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chats: chats,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PinChatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _PinChatsProvider && other.chats == chats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _PinChatsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chats` of this provider.
  List<ChatModel> get chats;
}

class _PinChatsProviderElement extends AutoDisposeFutureProviderElement<void>
    with _PinChatsRef {
  _PinChatsProviderElement(super.provider);

  @override
  List<ChatModel> get chats => (origin as _PinChatsProvider).chats;
}

String _$unpinChatHash() => r'6beabb6526f73809fe08d91403ab488147e48e00';

/// See also [_unpinChat].
@ProviderFor(_unpinChat)
const _unpinChatProvider = _UnpinChatFamily();

/// See also [_unpinChat].
class _UnpinChatFamily extends Family<AsyncValue<void>> {
  /// See also [_unpinChat].
  const _UnpinChatFamily();

  /// See also [_unpinChat].
  _UnpinChatProvider call({
    required ChatModel chat,
  }) {
    return _UnpinChatProvider(
      chat: chat,
    );
  }

  @override
  _UnpinChatProvider getProviderOverride(
    covariant _UnpinChatProvider provider,
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
  String? get name => r'_unpinChatProvider';
}

/// See also [_unpinChat].
class _UnpinChatProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_unpinChat].
  _UnpinChatProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _unpinChat(
            ref as _UnpinChatRef,
            chat: chat,
          ),
          from: _unpinChatProvider,
          name: r'_unpinChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unpinChatHash,
          dependencies: _UnpinChatFamily._dependencies,
          allTransitiveDependencies:
              _UnpinChatFamily._allTransitiveDependencies,
          chat: chat,
        );

  _UnpinChatProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(_UnpinChatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UnpinChatProvider._internal(
        (ref) => create(ref as _UnpinChatRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UnpinChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UnpinChatProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _UnpinChatRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _UnpinChatProviderElement extends AutoDisposeFutureProviderElement<void>
    with _UnpinChatRef {
  _UnpinChatProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _UnpinChatProvider).chat;
}

String _$unpinChatsHash() => r'71e73188199ab6f68f3d6acf89b892d27bef90dc';

/// See also [_unpinChats].
@ProviderFor(_unpinChats)
const _unpinChatsProvider = _UnpinChatsFamily();

/// See also [_unpinChats].
class _UnpinChatsFamily extends Family<AsyncValue<void>> {
  /// See also [_unpinChats].
  const _UnpinChatsFamily();

  /// See also [_unpinChats].
  _UnpinChatsProvider call({
    required List<ChatModel> chats,
  }) {
    return _UnpinChatsProvider(
      chats: chats,
    );
  }

  @override
  _UnpinChatsProvider getProviderOverride(
    covariant _UnpinChatsProvider provider,
  ) {
    return call(
      chats: provider.chats,
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
  String? get name => r'_unpinChatsProvider';
}

/// See also [_unpinChats].
class _UnpinChatsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [_unpinChats].
  _UnpinChatsProvider({
    required List<ChatModel> chats,
  }) : this._internal(
          (ref) => _unpinChats(
            ref as _UnpinChatsRef,
            chats: chats,
          ),
          from: _unpinChatsProvider,
          name: r'_unpinChatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unpinChatsHash,
          dependencies: _UnpinChatsFamily._dependencies,
          allTransitiveDependencies:
              _UnpinChatsFamily._allTransitiveDependencies,
          chats: chats,
        );

  _UnpinChatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chats,
  }) : super.internal();

  final List<ChatModel> chats;

  @override
  Override overrideWith(
    FutureOr<void> Function(_UnpinChatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _UnpinChatsProvider._internal(
        (ref) => create(ref as _UnpinChatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chats: chats,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UnpinChatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _UnpinChatsProvider && other.chats == chats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _UnpinChatsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chats` of this provider.
  List<ChatModel> get chats;
}

class _UnpinChatsProviderElement extends AutoDisposeFutureProviderElement<void>
    with _UnpinChatsRef {
  _UnpinChatsProviderElement(super.provider);

  @override
  List<ChatModel> get chats => (origin as _UnpinChatsProvider).chats;
}

String _$getPinnedMessagesHash() => r'87058148582e02c70d718091872532b1fe9fa240';

/// See also [_getPinnedMessages].
@ProviderFor(_getPinnedMessages)
const _getPinnedMessagesProvider = _GetPinnedMessagesFamily();

/// See also [_getPinnedMessages].
class _GetPinnedMessagesFamily extends Family<AsyncValue<Messages>> {
  /// See also [_getPinnedMessages].
  const _GetPinnedMessagesFamily();

  /// See also [_getPinnedMessages].
  _GetPinnedMessagesProvider call({
    required ChatModel chat,
  }) {
    return _GetPinnedMessagesProvider(
      chat: chat,
    );
  }

  @override
  _GetPinnedMessagesProvider getProviderOverride(
    covariant _GetPinnedMessagesProvider provider,
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
  String? get name => r'_getPinnedMessagesProvider';
}

/// See also [_getPinnedMessages].
class _GetPinnedMessagesProvider extends AutoDisposeFutureProvider<Messages> {
  /// See also [_getPinnedMessages].
  _GetPinnedMessagesProvider({
    required ChatModel chat,
  }) : this._internal(
          (ref) => _getPinnedMessages(
            ref as _GetPinnedMessagesRef,
            chat: chat,
          ),
          from: _getPinnedMessagesProvider,
          name: r'_getPinnedMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPinnedMessagesHash,
          dependencies: _GetPinnedMessagesFamily._dependencies,
          allTransitiveDependencies:
              _GetPinnedMessagesFamily._allTransitiveDependencies,
          chat: chat,
        );

  _GetPinnedMessagesProvider._internal(
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
  Override overrideWith(
    FutureOr<Messages> Function(_GetPinnedMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _GetPinnedMessagesProvider._internal(
        (ref) => create(ref as _GetPinnedMessagesRef),
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
  AutoDisposeFutureProviderElement<Messages> createElement() {
    return _GetPinnedMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _GetPinnedMessagesProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _GetPinnedMessagesRef on AutoDisposeFutureProviderRef<Messages> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;
}

class _GetPinnedMessagesProviderElement
    extends AutoDisposeFutureProviderElement<Messages>
    with _GetPinnedMessagesRef {
  _GetPinnedMessagesProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _GetPinnedMessagesProvider).chat;
}

String _$loadMorePinnedMessagesHash() =>
    r'3d1121c6e2410c85398b1062fdf1ce87a458d6e6';

/// See also [_loadMorePinnedMessages].
@ProviderFor(_loadMorePinnedMessages)
const _loadMorePinnedMessagesProvider = _LoadMorePinnedMessagesFamily();

/// See also [_loadMorePinnedMessages].
class _LoadMorePinnedMessagesFamily
    extends Family<AsyncValue<List<MessageModel>>> {
  /// See also [_loadMorePinnedMessages].
  const _LoadMorePinnedMessagesFamily();

  /// See also [_loadMorePinnedMessages].
  _LoadMorePinnedMessagesProvider call({
    required ChatModel chat,
    required int offset,
  }) {
    return _LoadMorePinnedMessagesProvider(
      chat: chat,
      offset: offset,
    );
  }

  @override
  _LoadMorePinnedMessagesProvider getProviderOverride(
    covariant _LoadMorePinnedMessagesProvider provider,
  ) {
    return call(
      chat: provider.chat,
      offset: provider.offset,
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
  String? get name => r'_loadMorePinnedMessagesProvider';
}

/// See also [_loadMorePinnedMessages].
class _LoadMorePinnedMessagesProvider
    extends AutoDisposeFutureProvider<List<MessageModel>> {
  /// See also [_loadMorePinnedMessages].
  _LoadMorePinnedMessagesProvider({
    required ChatModel chat,
    required int offset,
  }) : this._internal(
          (ref) => _loadMorePinnedMessages(
            ref as _LoadMorePinnedMessagesRef,
            chat: chat,
            offset: offset,
          ),
          from: _loadMorePinnedMessagesProvider,
          name: r'_loadMorePinnedMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadMorePinnedMessagesHash,
          dependencies: _LoadMorePinnedMessagesFamily._dependencies,
          allTransitiveDependencies:
              _LoadMorePinnedMessagesFamily._allTransitiveDependencies,
          chat: chat,
          offset: offset,
        );

  _LoadMorePinnedMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chat,
    required this.offset,
  }) : super.internal();

  final ChatModel chat;
  final int offset;

  @override
  Override overrideWith(
    FutureOr<List<MessageModel>> Function(_LoadMorePinnedMessagesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _LoadMorePinnedMessagesProvider._internal(
        (ref) => create(ref as _LoadMorePinnedMessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chat: chat,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MessageModel>> createElement() {
    return _LoadMorePinnedMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _LoadMorePinnedMessagesProvider &&
        other.chat == chat &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _LoadMorePinnedMessagesRef
    on AutoDisposeFutureProviderRef<List<MessageModel>> {
  /// The parameter `chat` of this provider.
  ChatModel get chat;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _LoadMorePinnedMessagesProviderElement
    extends AutoDisposeFutureProviderElement<List<MessageModel>>
    with _LoadMorePinnedMessagesRef {
  _LoadMorePinnedMessagesProviderElement(super.provider);

  @override
  ChatModel get chat => (origin as _LoadMorePinnedMessagesProvider).chat;
  @override
  int get offset => (origin as _LoadMorePinnedMessagesProvider).offset;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
