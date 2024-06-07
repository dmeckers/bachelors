// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_page_states_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkRelationShipStatusHash() =>
    r'2f12a74cad031ec3d0c4cee01e40e4f8437a2807';

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
    extends Family<AsyncValue<FriendShipStatusModel>> {
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
    extends AutoDisposeFutureProvider<FriendShipStatusModel> {
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
    FutureOr<FriendShipStatusModel> Function(
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
  AutoDisposeFutureProviderElement<FriendShipStatusModel> createElement() {
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
    on AutoDisposeFutureProviderRef<FriendShipStatusModel> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _CheckRelationShipStatusProviderElement
    extends AutoDisposeFutureProviderElement<FriendShipStatusModel>
    with CheckRelationShipStatusRef {
  _CheckRelationShipStatusProviderElement(super.provider);

  @override
  String get userId => (origin as CheckRelationShipStatusProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
