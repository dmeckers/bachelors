// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPrivacySettingsHash() =>
    r'c1d68ff5de10fa935b712a2f8831c8ccdff2798a';

/// See also [getPrivacySettings].
@ProviderFor(getPrivacySettings)
final getPrivacySettingsProvider =
    AutoDisposeFutureProvider<UserProfilePrivacySettingsModel>.internal(
  getPrivacySettings,
  name: r'getPrivacySettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPrivacySettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPrivacySettingsRef
    = AutoDisposeFutureProviderRef<UserProfilePrivacySettingsModel>;
String _$updateMapVisibilityHash() =>
    r'08225a5bdee9fc9e8434e521bba79ec79162c3c6';

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

/// See also [updateMapVisibility].
@ProviderFor(updateMapVisibility)
const updateMapVisibilityProvider = UpdateMapVisibilityFamily();

/// See also [updateMapVisibility].
class UpdateMapVisibilityFamily extends Family<AsyncValue<void>> {
  /// See also [updateMapVisibility].
  const UpdateMapVisibilityFamily();

  /// See also [updateMapVisibility].
  UpdateMapVisibilityProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateMapVisibilityProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateMapVisibilityProvider getProviderOverride(
    covariant UpdateMapVisibilityProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateMapVisibilityProvider';
}

/// See also [updateMapVisibility].
class UpdateMapVisibilityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateMapVisibility].
  UpdateMapVisibilityProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateMapVisibility(
            ref as UpdateMapVisibilityRef,
            visibility: visibility,
          ),
          from: updateMapVisibilityProvider,
          name: r'updateMapVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMapVisibilityHash,
          dependencies: UpdateMapVisibilityFamily._dependencies,
          allTransitiveDependencies:
              UpdateMapVisibilityFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateMapVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateMapVisibilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMapVisibilityProvider._internal(
        (ref) => create(ref as UpdateMapVisibilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateMapVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMapVisibilityProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateMapVisibilityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateMapVisibilityProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateMapVisibilityRef {
  _UpdateMapVisibilityProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateMapVisibilityProvider).visibility;
}

String _$updateAboutMeVisibilityHash() =>
    r'b8b76503cc93e30250f680949e686460bf8fafd7';

/// See also [updateAboutMeVisibility].
@ProviderFor(updateAboutMeVisibility)
const updateAboutMeVisibilityProvider = UpdateAboutMeVisibilityFamily();

/// See also [updateAboutMeVisibility].
class UpdateAboutMeVisibilityFamily extends Family<AsyncValue<void>> {
  /// See also [updateAboutMeVisibility].
  const UpdateAboutMeVisibilityFamily();

  /// See also [updateAboutMeVisibility].
  UpdateAboutMeVisibilityProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateAboutMeVisibilityProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateAboutMeVisibilityProvider getProviderOverride(
    covariant UpdateAboutMeVisibilityProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateAboutMeVisibilityProvider';
}

/// See also [updateAboutMeVisibility].
class UpdateAboutMeVisibilityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateAboutMeVisibility].
  UpdateAboutMeVisibilityProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateAboutMeVisibility(
            ref as UpdateAboutMeVisibilityRef,
            visibility: visibility,
          ),
          from: updateAboutMeVisibilityProvider,
          name: r'updateAboutMeVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAboutMeVisibilityHash,
          dependencies: UpdateAboutMeVisibilityFamily._dependencies,
          allTransitiveDependencies:
              UpdateAboutMeVisibilityFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateAboutMeVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateAboutMeVisibilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAboutMeVisibilityProvider._internal(
        (ref) => create(ref as UpdateAboutMeVisibilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateAboutMeVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAboutMeVisibilityProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateAboutMeVisibilityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateAboutMeVisibilityProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateAboutMeVisibilityRef {
  _UpdateAboutMeVisibilityProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateAboutMeVisibilityProvider).visibility;
}

String _$updateCanBeInvitedToJamsHash() =>
    r'02ac99209d57c907a8c567d16d7525b94c3e4e21';

/// See also [updateCanBeInvitedToJams].
@ProviderFor(updateCanBeInvitedToJams)
const updateCanBeInvitedToJamsProvider = UpdateCanBeInvitedToJamsFamily();

/// See also [updateCanBeInvitedToJams].
class UpdateCanBeInvitedToJamsFamily extends Family<AsyncValue<void>> {
  /// See also [updateCanBeInvitedToJams].
  const UpdateCanBeInvitedToJamsFamily();

  /// See also [updateCanBeInvitedToJams].
  UpdateCanBeInvitedToJamsProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateCanBeInvitedToJamsProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateCanBeInvitedToJamsProvider getProviderOverride(
    covariant UpdateCanBeInvitedToJamsProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateCanBeInvitedToJamsProvider';
}

/// See also [updateCanBeInvitedToJams].
class UpdateCanBeInvitedToJamsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateCanBeInvitedToJams].
  UpdateCanBeInvitedToJamsProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateCanBeInvitedToJams(
            ref as UpdateCanBeInvitedToJamsRef,
            visibility: visibility,
          ),
          from: updateCanBeInvitedToJamsProvider,
          name: r'updateCanBeInvitedToJamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCanBeInvitedToJamsHash,
          dependencies: UpdateCanBeInvitedToJamsFamily._dependencies,
          allTransitiveDependencies:
              UpdateCanBeInvitedToJamsFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateCanBeInvitedToJamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateCanBeInvitedToJamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCanBeInvitedToJamsProvider._internal(
        (ref) => create(ref as UpdateCanBeInvitedToJamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateCanBeInvitedToJamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCanBeInvitedToJamsProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCanBeInvitedToJamsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateCanBeInvitedToJamsProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateCanBeInvitedToJamsRef {
  _UpdateCanBeInvitedToJamsProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateCanBeInvitedToJamsProvider).visibility;
}

String _$updateCanBeFoundByPhoneNumberHash() =>
    r'fc85680d677ad0ecb9190d4b06616b6accea5450';

/// See also [updateCanBeFoundByPhoneNumber].
@ProviderFor(updateCanBeFoundByPhoneNumber)
const updateCanBeFoundByPhoneNumberProvider =
    UpdateCanBeFoundByPhoneNumberFamily();

/// See also [updateCanBeFoundByPhoneNumber].
class UpdateCanBeFoundByPhoneNumberFamily extends Family<AsyncValue<void>> {
  /// See also [updateCanBeFoundByPhoneNumber].
  const UpdateCanBeFoundByPhoneNumberFamily();

  /// See also [updateCanBeFoundByPhoneNumber].
  UpdateCanBeFoundByPhoneNumberProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateCanBeFoundByPhoneNumberProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateCanBeFoundByPhoneNumberProvider getProviderOverride(
    covariant UpdateCanBeFoundByPhoneNumberProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateCanBeFoundByPhoneNumberProvider';
}

/// See also [updateCanBeFoundByPhoneNumber].
class UpdateCanBeFoundByPhoneNumberProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [updateCanBeFoundByPhoneNumber].
  UpdateCanBeFoundByPhoneNumberProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateCanBeFoundByPhoneNumber(
            ref as UpdateCanBeFoundByPhoneNumberRef,
            visibility: visibility,
          ),
          from: updateCanBeFoundByPhoneNumberProvider,
          name: r'updateCanBeFoundByPhoneNumberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCanBeFoundByPhoneNumberHash,
          dependencies: UpdateCanBeFoundByPhoneNumberFamily._dependencies,
          allTransitiveDependencies:
              UpdateCanBeFoundByPhoneNumberFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateCanBeFoundByPhoneNumberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateCanBeFoundByPhoneNumberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCanBeFoundByPhoneNumberProvider._internal(
        (ref) => create(ref as UpdateCanBeFoundByPhoneNumberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateCanBeFoundByPhoneNumberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCanBeFoundByPhoneNumberProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCanBeFoundByPhoneNumberRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateCanBeFoundByPhoneNumberProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateCanBeFoundByPhoneNumberRef {
  _UpdateCanBeFoundByPhoneNumberProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateCanBeFoundByPhoneNumberProvider).visibility;
}

String _$updatePhoneVisibilityHash() =>
    r'09d2f50ea96f7e6596e744572a14b4a031dd0d77';

/// See also [updatePhoneVisibility].
@ProviderFor(updatePhoneVisibility)
const updatePhoneVisibilityProvider = UpdatePhoneVisibilityFamily();

/// See also [updatePhoneVisibility].
class UpdatePhoneVisibilityFamily extends Family<AsyncValue<void>> {
  /// See also [updatePhoneVisibility].
  const UpdatePhoneVisibilityFamily();

  /// See also [updatePhoneVisibility].
  UpdatePhoneVisibilityProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdatePhoneVisibilityProvider(
      visibility: visibility,
    );
  }

  @override
  UpdatePhoneVisibilityProvider getProviderOverride(
    covariant UpdatePhoneVisibilityProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updatePhoneVisibilityProvider';
}

/// See also [updatePhoneVisibility].
class UpdatePhoneVisibilityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updatePhoneVisibility].
  UpdatePhoneVisibilityProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updatePhoneVisibility(
            ref as UpdatePhoneVisibilityRef,
            visibility: visibility,
          ),
          from: updatePhoneVisibilityProvider,
          name: r'updatePhoneVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePhoneVisibilityHash,
          dependencies: UpdatePhoneVisibilityFamily._dependencies,
          allTransitiveDependencies:
              UpdatePhoneVisibilityFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdatePhoneVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdatePhoneVisibilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePhoneVisibilityProvider._internal(
        (ref) => create(ref as UpdatePhoneVisibilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdatePhoneVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePhoneVisibilityProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdatePhoneVisibilityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdatePhoneVisibilityProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdatePhoneVisibilityRef {
  _UpdatePhoneVisibilityProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdatePhoneVisibilityProvider).visibility;
}

String _$updateCanBeInvitedToCommunitiesHash() =>
    r'76e8290dcb3b56aca598353a2903cb209947424a';

/// See also [updateCanBeInvitedToCommunities].
@ProviderFor(updateCanBeInvitedToCommunities)
const updateCanBeInvitedToCommunitiesProvider =
    UpdateCanBeInvitedToCommunitiesFamily();

/// See also [updateCanBeInvitedToCommunities].
class UpdateCanBeInvitedToCommunitiesFamily extends Family<AsyncValue<void>> {
  /// See also [updateCanBeInvitedToCommunities].
  const UpdateCanBeInvitedToCommunitiesFamily();

  /// See also [updateCanBeInvitedToCommunities].
  UpdateCanBeInvitedToCommunitiesProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateCanBeInvitedToCommunitiesProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateCanBeInvitedToCommunitiesProvider getProviderOverride(
    covariant UpdateCanBeInvitedToCommunitiesProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateCanBeInvitedToCommunitiesProvider';
}

/// See also [updateCanBeInvitedToCommunities].
class UpdateCanBeInvitedToCommunitiesProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [updateCanBeInvitedToCommunities].
  UpdateCanBeInvitedToCommunitiesProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateCanBeInvitedToCommunities(
            ref as UpdateCanBeInvitedToCommunitiesRef,
            visibility: visibility,
          ),
          from: updateCanBeInvitedToCommunitiesProvider,
          name: r'updateCanBeInvitedToCommunitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCanBeInvitedToCommunitiesHash,
          dependencies: UpdateCanBeInvitedToCommunitiesFamily._dependencies,
          allTransitiveDependencies:
              UpdateCanBeInvitedToCommunitiesFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateCanBeInvitedToCommunitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateCanBeInvitedToCommunitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCanBeInvitedToCommunitiesProvider._internal(
        (ref) => create(ref as UpdateCanBeInvitedToCommunitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateCanBeInvitedToCommunitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCanBeInvitedToCommunitiesProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCanBeInvitedToCommunitiesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateCanBeInvitedToCommunitiesProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateCanBeInvitedToCommunitiesRef {
  _UpdateCanBeInvitedToCommunitiesProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateCanBeInvitedToCommunitiesProvider).visibility;
}

String _$updateLastSeenVisibilityHash() =>
    r'03d66b775b3a1415a00c6e1650a9539e3ff86f89';

/// See also [updateLastSeenVisibility].
@ProviderFor(updateLastSeenVisibility)
const updateLastSeenVisibilityProvider = UpdateLastSeenVisibilityFamily();

/// See also [updateLastSeenVisibility].
class UpdateLastSeenVisibilityFamily extends Family<AsyncValue<void>> {
  /// See also [updateLastSeenVisibility].
  const UpdateLastSeenVisibilityFamily();

  /// See also [updateLastSeenVisibility].
  UpdateLastSeenVisibilityProvider call({
    required PrivacyBoundaries visibility,
  }) {
    return UpdateLastSeenVisibilityProvider(
      visibility: visibility,
    );
  }

  @override
  UpdateLastSeenVisibilityProvider getProviderOverride(
    covariant UpdateLastSeenVisibilityProvider provider,
  ) {
    return call(
      visibility: provider.visibility,
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
  String? get name => r'updateLastSeenVisibilityProvider';
}

/// See also [updateLastSeenVisibility].
class UpdateLastSeenVisibilityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateLastSeenVisibility].
  UpdateLastSeenVisibilityProvider({
    required PrivacyBoundaries visibility,
  }) : this._internal(
          (ref) => updateLastSeenVisibility(
            ref as UpdateLastSeenVisibilityRef,
            visibility: visibility,
          ),
          from: updateLastSeenVisibilityProvider,
          name: r'updateLastSeenVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateLastSeenVisibilityHash,
          dependencies: UpdateLastSeenVisibilityFamily._dependencies,
          allTransitiveDependencies:
              UpdateLastSeenVisibilityFamily._allTransitiveDependencies,
          visibility: visibility,
        );

  UpdateLastSeenVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.visibility,
  }) : super.internal();

  final PrivacyBoundaries visibility;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateLastSeenVisibilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateLastSeenVisibilityProvider._internal(
        (ref) => create(ref as UpdateLastSeenVisibilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        visibility: visibility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateLastSeenVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateLastSeenVisibilityProvider &&
        other.visibility == visibility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, visibility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateLastSeenVisibilityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `visibility` of this provider.
  PrivacyBoundaries get visibility;
}

class _UpdateLastSeenVisibilityProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateLastSeenVisibilityRef {
  _UpdateLastSeenVisibilityProviderElement(super.provider);

  @override
  PrivacyBoundaries get visibility =>
      (origin as UpdateLastSeenVisibilityProvider).visibility;
}

String _$updateMapVisibilityWhiteListHash() =>
    r'3caf26410ed5f9f9a71afabebd7075147e796411';

/// See also [updateMapVisibilityWhiteList].
@ProviderFor(updateMapVisibilityWhiteList)
const updateMapVisibilityWhiteListProvider =
    UpdateMapVisibilityWhiteListFamily();

/// See also [updateMapVisibilityWhiteList].
class UpdateMapVisibilityWhiteListFamily extends Family<AsyncValue<void>> {
  /// See also [updateMapVisibilityWhiteList].
  const UpdateMapVisibilityWhiteListFamily();

  /// See also [updateMapVisibilityWhiteList].
  UpdateMapVisibilityWhiteListProvider call({
    required List<UserProfileModel> whiteList,
  }) {
    return UpdateMapVisibilityWhiteListProvider(
      whiteList: whiteList,
    );
  }

  @override
  UpdateMapVisibilityWhiteListProvider getProviderOverride(
    covariant UpdateMapVisibilityWhiteListProvider provider,
  ) {
    return call(
      whiteList: provider.whiteList,
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
  String? get name => r'updateMapVisibilityWhiteListProvider';
}

/// See also [updateMapVisibilityWhiteList].
class UpdateMapVisibilityWhiteListProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [updateMapVisibilityWhiteList].
  UpdateMapVisibilityWhiteListProvider({
    required List<UserProfileModel> whiteList,
  }) : this._internal(
          (ref) => updateMapVisibilityWhiteList(
            ref as UpdateMapVisibilityWhiteListRef,
            whiteList: whiteList,
          ),
          from: updateMapVisibilityWhiteListProvider,
          name: r'updateMapVisibilityWhiteListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMapVisibilityWhiteListHash,
          dependencies: UpdateMapVisibilityWhiteListFamily._dependencies,
          allTransitiveDependencies:
              UpdateMapVisibilityWhiteListFamily._allTransitiveDependencies,
          whiteList: whiteList,
        );

  UpdateMapVisibilityWhiteListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.whiteList,
  }) : super.internal();

  final List<UserProfileModel> whiteList;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateMapVisibilityWhiteListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMapVisibilityWhiteListProvider._internal(
        (ref) => create(ref as UpdateMapVisibilityWhiteListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        whiteList: whiteList,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateMapVisibilityWhiteListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMapVisibilityWhiteListProvider &&
        other.whiteList == whiteList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whiteList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateMapVisibilityWhiteListRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `whiteList` of this provider.
  List<UserProfileModel> get whiteList;
}

class _UpdateMapVisibilityWhiteListProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateMapVisibilityWhiteListRef {
  _UpdateMapVisibilityWhiteListProviderElement(super.provider);

  @override
  List<UserProfileModel> get whiteList =>
      (origin as UpdateMapVisibilityWhiteListProvider).whiteList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
