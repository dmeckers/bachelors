// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkRelationShipStatusHash() =>
    r'adde4a24911c70df419c5524e297ac262ad467de';

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

/// See also [checkRelationShipStatus].
@ProviderFor(checkRelationShipStatus)
const checkRelationShipStatusProvider = CheckRelationShipStatusFamily();

/// See also [checkRelationShipStatus].
class CheckRelationShipStatusFamily
    extends Family<AsyncValue<UserWithRelationshipStatus>> {
  /// See also [checkRelationShipStatus].
  const CheckRelationShipStatusFamily();

  /// See also [checkRelationShipStatus].
  CheckRelationShipStatusProvider call({
    required String userId,
  }) {
    return CheckRelationShipStatusProvider(
      userId: userId,
    );
  }

  @override
  CheckRelationShipStatusProvider getProviderOverride(
    covariant CheckRelationShipStatusProvider provider,
  ) {
    return call(
      userId: provider.userId,
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
  String? get name => r'checkRelationShipStatusProvider';
}

/// See also [checkRelationShipStatus].
class CheckRelationShipStatusProvider
    extends AutoDisposeFutureProvider<UserWithRelationshipStatus> {
  /// See also [checkRelationShipStatus].
  CheckRelationShipStatusProvider({
    required String userId,
  }) : this._internal(
          (ref) => checkRelationShipStatus(
            ref as CheckRelationShipStatusRef,
            userId: userId,
          ),
          from: checkRelationShipStatusProvider,
          name: r'checkRelationShipStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkRelationShipStatusHash,
          dependencies: CheckRelationShipStatusFamily._dependencies,
          allTransitiveDependencies:
              CheckRelationShipStatusFamily._allTransitiveDependencies,
          userId: userId,
        );

  CheckRelationShipStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<UserWithRelationshipStatus> Function(
            CheckRelationShipStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckRelationShipStatusProvider._internal(
        (ref) => create(ref as CheckRelationShipStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserWithRelationshipStatus> createElement() {
    return _CheckRelationShipStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckRelationShipStatusProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckRelationShipStatusRef
    on AutoDisposeFutureProviderRef<UserWithRelationshipStatus> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _CheckRelationShipStatusProviderElement
    extends AutoDisposeFutureProviderElement<UserWithRelationshipStatus>
    with CheckRelationShipStatusRef {
  _CheckRelationShipStatusProviderElement(super.provider);

  @override
  String get userId => (origin as CheckRelationShipStatusProvider).userId;
}

String _$sendFriendInviteHash() => r'59a6a36ad5ed6b061e901d0877b7d7ba37b89019';

/// See also [sendFriendInvite].
@ProviderFor(sendFriendInvite)
const sendFriendInviteProvider = SendFriendInviteFamily();

/// See also [sendFriendInvite].
class SendFriendInviteFamily extends Family<AsyncValue<bool>> {
  /// See also [sendFriendInvite].
  const SendFriendInviteFamily();

  /// See also [sendFriendInvite].
  SendFriendInviteProvider call({
    required String userId,
  }) {
    return SendFriendInviteProvider(
      userId: userId,
    );
  }

  @override
  SendFriendInviteProvider getProviderOverride(
    covariant SendFriendInviteProvider provider,
  ) {
    return call(
      userId: provider.userId,
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
  String? get name => r'sendFriendInviteProvider';
}

/// See also [sendFriendInvite].
class SendFriendInviteProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [sendFriendInvite].
  SendFriendInviteProvider({
    required String userId,
  }) : this._internal(
          (ref) => sendFriendInvite(
            ref as SendFriendInviteRef,
            userId: userId,
          ),
          from: sendFriendInviteProvider,
          name: r'sendFriendInviteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendFriendInviteHash,
          dependencies: SendFriendInviteFamily._dependencies,
          allTransitiveDependencies:
              SendFriendInviteFamily._allTransitiveDependencies,
          userId: userId,
        );

  SendFriendInviteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SendFriendInviteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendFriendInviteProvider._internal(
        (ref) => create(ref as SendFriendInviteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SendFriendInviteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendFriendInviteProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendFriendInviteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _SendFriendInviteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SendFriendInviteRef {
  _SendFriendInviteProviderElement(super.provider);

  @override
  String get userId => (origin as SendFriendInviteProvider).userId;
}

String _$joinJamFromMapHash() => r'562eb3ce524a043f84c5dfb532ec466020748a09';

/// See also [joinJamFromMap].
@ProviderFor(joinJamFromMap)
const joinJamFromMapProvider = JoinJamFromMapFamily();

/// See also [joinJamFromMap].
class JoinJamFromMapFamily extends Family<AsyncValue<bool>> {
  /// See also [joinJamFromMap].
  const JoinJamFromMapFamily();

  /// See also [joinJamFromMap].
  JoinJamFromMapProvider call({
    required int jamId,
  }) {
    return JoinJamFromMapProvider(
      jamId: jamId,
    );
  }

  @override
  JoinJamFromMapProvider getProviderOverride(
    covariant JoinJamFromMapProvider provider,
  ) {
    return call(
      jamId: provider.jamId,
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
  String? get name => r'joinJamFromMapProvider';
}

/// See also [joinJamFromMap].
class JoinJamFromMapProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [joinJamFromMap].
  JoinJamFromMapProvider({
    required int jamId,
  }) : this._internal(
          (ref) => joinJamFromMap(
            ref as JoinJamFromMapRef,
            jamId: jamId,
          ),
          from: joinJamFromMapProvider,
          name: r'joinJamFromMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$joinJamFromMapHash,
          dependencies: JoinJamFromMapFamily._dependencies,
          allTransitiveDependencies:
              JoinJamFromMapFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  JoinJamFromMapProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jamId,
  }) : super.internal();

  final int jamId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(JoinJamFromMapRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: JoinJamFromMapProvider._internal(
        (ref) => create(ref as JoinJamFromMapRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jamId: jamId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _JoinJamFromMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is JoinJamFromMapProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JoinJamFromMapRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _JoinJamFromMapProviderElement
    extends AutoDisposeFutureProviderElement<bool> with JoinJamFromMapRef {
  _JoinJamFromMapProviderElement(super.provider);

  @override
  int get jamId => (origin as JoinJamFromMapProvider).jamId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
