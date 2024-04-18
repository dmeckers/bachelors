// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendEdittedTextMessageHash() =>
    r'7294888b60f40c820a2b8c2b414471bf505749eb';

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

/// See also [sendEdittedTextMessage].
@ProviderFor(sendEdittedTextMessage)
const sendEdittedTextMessageProvider = SendEdittedTextMessageFamily();

/// See also [sendEdittedTextMessage].
class SendEdittedTextMessageFamily extends Family<AsyncValue> {
  /// See also [sendEdittedTextMessage].
  const SendEdittedTextMessageFamily();

  /// See also [sendEdittedTextMessage].
  SendEdittedTextMessageProvider call(
    int chatId,
    UserProfileModel contact,
    MessageModel editable,
  ) {
    return SendEdittedTextMessageProvider(
      chatId,
      contact,
      editable,
    );
  }

  @override
  SendEdittedTextMessageProvider getProviderOverride(
    covariant SendEdittedTextMessageProvider provider,
  ) {
    return call(
      provider.chatId,
      provider.contact,
      provider.editable,
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
  String? get name => r'sendEdittedTextMessageProvider';
}

/// See also [sendEdittedTextMessage].
class SendEdittedTextMessageProvider
    extends AutoDisposeFutureProvider<Object?> {
  /// See also [sendEdittedTextMessage].
  SendEdittedTextMessageProvider(
    int chatId,
    UserProfileModel contact,
    MessageModel editable,
  ) : this._internal(
          (ref) => sendEdittedTextMessage(
            ref as SendEdittedTextMessageRef,
            chatId,
            contact,
            editable,
          ),
          from: sendEdittedTextMessageProvider,
          name: r'sendEdittedTextMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendEdittedTextMessageHash,
          dependencies: SendEdittedTextMessageFamily._dependencies,
          allTransitiveDependencies:
              SendEdittedTextMessageFamily._allTransitiveDependencies,
          chatId: chatId,
          contact: contact,
          editable: editable,
        );

  SendEdittedTextMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
    required this.contact,
    required this.editable,
  }) : super.internal();

  final int chatId;
  final UserProfileModel contact;
  final MessageModel editable;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(SendEdittedTextMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendEdittedTextMessageProvider._internal(
        (ref) => create(ref as SendEdittedTextMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
        contact: contact,
        editable: editable,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _SendEdittedTextMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendEdittedTextMessageProvider &&
        other.chatId == chatId &&
        other.contact == contact &&
        other.editable == editable;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);
    hash = _SystemHash.combine(hash, contact.hashCode);
    hash = _SystemHash.combine(hash, editable.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendEdittedTextMessageRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `chatId` of this provider.
  int get chatId;

  /// The parameter `contact` of this provider.
  UserProfileModel get contact;

  /// The parameter `editable` of this provider.
  MessageModel get editable;
}

class _SendEdittedTextMessageProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with SendEdittedTextMessageRef {
  _SendEdittedTextMessageProviderElement(super.provider);

  @override
  int get chatId => (origin as SendEdittedTextMessageProvider).chatId;
  @override
  UserProfileModel get contact =>
      (origin as SendEdittedTextMessageProvider).contact;
  @override
  MessageModel get editable =>
      (origin as SendEdittedTextMessageProvider).editable;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
