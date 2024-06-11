// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getJamByIdHash() => r'23efdc644053b42e51c9d1fa9e55709490482bc9';

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

/// See also [getJamById].
@ProviderFor(getJamById)
const getJamByIdProvider = GetJamByIdFamily();

/// See also [getJamById].
class GetJamByIdFamily extends Family<AsyncValue<JamModel>> {
  /// See also [getJamById].
  const GetJamByIdFamily();

  /// See also [getJamById].
  GetJamByIdProvider call({
    required int jamId,
  }) {
    return GetJamByIdProvider(
      jamId: jamId,
    );
  }

  @override
  GetJamByIdProvider getProviderOverride(
    covariant GetJamByIdProvider provider,
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
  String? get name => r'getJamByIdProvider';
}

/// See also [getJamById].
class GetJamByIdProvider extends AutoDisposeFutureProvider<JamModel> {
  /// See also [getJamById].
  GetJamByIdProvider({
    required int jamId,
  }) : this._internal(
          (ref) => getJamById(
            ref as GetJamByIdRef,
            jamId: jamId,
          ),
          from: getJamByIdProvider,
          name: r'getJamByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getJamByIdHash,
          dependencies: GetJamByIdFamily._dependencies,
          allTransitiveDependencies:
              GetJamByIdFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  GetJamByIdProvider._internal(
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
    FutureOr<JamModel> Function(GetJamByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetJamByIdProvider._internal(
        (ref) => create(ref as GetJamByIdRef),
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
  AutoDisposeFutureProviderElement<JamModel> createElement() {
    return _GetJamByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetJamByIdProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetJamByIdRef on AutoDisposeFutureProviderRef<JamModel> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _GetJamByIdProviderElement
    extends AutoDisposeFutureProviderElement<JamModel> with GetJamByIdRef {
  _GetJamByIdProviderElement(super.provider);

  @override
  int get jamId => (origin as GetJamByIdProvider).jamId;
}

String _$getOutdatedJamsHash() => r'5520d3290ee9a02eb744073cb63eefee45d3b3d7';

/// See also [getOutdatedJams].
@ProviderFor(getOutdatedJams)
final getOutdatedJamsProvider = AutoDisposeFutureProvider<Jams>.internal(
  getOutdatedJams,
  name: r'getOutdatedJamsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOutdatedJamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOutdatedJamsRef = AutoDisposeFutureProviderRef<Jams>;
String _$getParticipatingJamsHash() =>
    r'644c91bc506de3f3a9fdad3bfa299073c3dfe7e7';

/// See also [getParticipatingJams].
@ProviderFor(getParticipatingJams)
final getParticipatingJamsProvider = AutoDisposeFutureProvider<Jams>.internal(
  getParticipatingJams,
  name: r'getParticipatingJamsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getParticipatingJamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetParticipatingJamsRef = AutoDisposeFutureProviderRef<Jams>;
String _$updateJamHash() => r'd1fd9f4bbdc7d2e98f9e8d478413bb95f49279fb';

/// See also [updateJam].
@ProviderFor(updateJam)
const updateJamProvider = UpdateJamFamily();

/// See also [updateJam].
class UpdateJamFamily extends Family<AsyncValue<Jams>> {
  /// See also [updateJam].
  const UpdateJamFamily();

  /// See also [updateJam].
  UpdateJamProvider call({
    required JamModel jam,
  }) {
    return UpdateJamProvider(
      jam: jam,
    );
  }

  @override
  UpdateJamProvider getProviderOverride(
    covariant UpdateJamProvider provider,
  ) {
    return call(
      jam: provider.jam,
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
  String? get name => r'updateJamProvider';
}

/// See also [updateJam].
class UpdateJamProvider extends AutoDisposeFutureProvider<Jams> {
  /// See also [updateJam].
  UpdateJamProvider({
    required JamModel jam,
  }) : this._internal(
          (ref) => updateJam(
            ref as UpdateJamRef,
            jam: jam,
          ),
          from: updateJamProvider,
          name: r'updateJamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateJamHash,
          dependencies: UpdateJamFamily._dependencies,
          allTransitiveDependencies: UpdateJamFamily._allTransitiveDependencies,
          jam: jam,
        );

  UpdateJamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jam,
  }) : super.internal();

  final JamModel jam;

  @override
  Override overrideWith(
    FutureOr<Jams> Function(UpdateJamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateJamProvider._internal(
        (ref) => create(ref as UpdateJamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jam: jam,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Jams> createElement() {
    return _UpdateJamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateJamProvider && other.jam == jam;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jam.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateJamRef on AutoDisposeFutureProviderRef<Jams> {
  /// The parameter `jam` of this provider.
  JamModel get jam;
}

class _UpdateJamProviderElement extends AutoDisposeFutureProviderElement<Jams>
    with UpdateJamRef {
  _UpdateJamProviderElement(super.provider);

  @override
  JamModel get jam => (origin as UpdateJamProvider).jam;
}

String _$getJamJoinRequestsHash() =>
    r'a5ca36e76bc8a5c747c8cd1a108753cd1ec9849f';

/// See also [getJamJoinRequests].
@ProviderFor(getJamJoinRequests)
const getJamJoinRequestsProvider = GetJamJoinRequestsFamily();

/// See also [getJamJoinRequests].
class GetJamJoinRequestsFamily
    extends Family<AsyncValue<List<BaseJamFormModel>>> {
  /// See also [getJamJoinRequests].
  const GetJamJoinRequestsFamily();

  /// See also [getJamJoinRequests].
  GetJamJoinRequestsProvider call({
    required int jamId,
  }) {
    return GetJamJoinRequestsProvider(
      jamId: jamId,
    );
  }

  @override
  GetJamJoinRequestsProvider getProviderOverride(
    covariant GetJamJoinRequestsProvider provider,
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
  String? get name => r'getJamJoinRequestsProvider';
}

/// See also [getJamJoinRequests].
class GetJamJoinRequestsProvider
    extends AutoDisposeFutureProvider<List<BaseJamFormModel>> {
  /// See also [getJamJoinRequests].
  GetJamJoinRequestsProvider({
    required int jamId,
  }) : this._internal(
          (ref) => getJamJoinRequests(
            ref as GetJamJoinRequestsRef,
            jamId: jamId,
          ),
          from: getJamJoinRequestsProvider,
          name: r'getJamJoinRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getJamJoinRequestsHash,
          dependencies: GetJamJoinRequestsFamily._dependencies,
          allTransitiveDependencies:
              GetJamJoinRequestsFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  GetJamJoinRequestsProvider._internal(
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
    FutureOr<List<BaseJamFormModel>> Function(GetJamJoinRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetJamJoinRequestsProvider._internal(
        (ref) => create(ref as GetJamJoinRequestsRef),
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
  AutoDisposeFutureProviderElement<List<BaseJamFormModel>> createElement() {
    return _GetJamJoinRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetJamJoinRequestsProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetJamJoinRequestsRef
    on AutoDisposeFutureProviderRef<List<BaseJamFormModel>> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _GetJamJoinRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<BaseJamFormModel>>
    with GetJamJoinRequestsRef {
  _GetJamJoinRequestsProviderElement(super.provider);

  @override
  int get jamId => (origin as GetJamJoinRequestsProvider).jamId;
}

String _$getJamFormHash() => r'717edcb9e8f545318e5ea0ded5e1190f95f5a0d0';

/// See also [getJamForm].
@ProviderFor(getJamForm)
const getJamFormProvider = GetJamFormFamily();

/// See also [getJamForm].
class GetJamFormFamily extends Family<AsyncValue<BaseJamFormModel>> {
  /// See also [getJamForm].
  const GetJamFormFamily();

  /// See also [getJamForm].
  GetJamFormProvider call({
    required int jamId,
  }) {
    return GetJamFormProvider(
      jamId: jamId,
    );
  }

  @override
  GetJamFormProvider getProviderOverride(
    covariant GetJamFormProvider provider,
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
  String? get name => r'getJamFormProvider';
}

/// See also [getJamForm].
class GetJamFormProvider extends AutoDisposeFutureProvider<BaseJamFormModel> {
  /// See also [getJamForm].
  GetJamFormProvider({
    required int jamId,
  }) : this._internal(
          (ref) => getJamForm(
            ref as GetJamFormRef,
            jamId: jamId,
          ),
          from: getJamFormProvider,
          name: r'getJamFormProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getJamFormHash,
          dependencies: GetJamFormFamily._dependencies,
          allTransitiveDependencies:
              GetJamFormFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  GetJamFormProvider._internal(
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
    FutureOr<BaseJamFormModel> Function(GetJamFormRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetJamFormProvider._internal(
        (ref) => create(ref as GetJamFormRef),
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
  AutoDisposeFutureProviderElement<BaseJamFormModel> createElement() {
    return _GetJamFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetJamFormProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetJamFormRef on AutoDisposeFutureProviderRef<BaseJamFormModel> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _GetJamFormProviderElement
    extends AutoDisposeFutureProviderElement<BaseJamFormModel>
    with GetJamFormRef {
  _GetJamFormProviderElement(super.provider);

  @override
  int get jamId => (origin as GetJamFormProvider).jamId;
}

String _$createJamHash() => r'0efce6f66578d747ae642f516ccfc05cabe6b8ac';

/// See also [createJam].
@ProviderFor(createJam)
const createJamProvider = CreateJamFamily();

/// See also [createJam].
class CreateJamFamily extends Family<AsyncValue<JamModel>> {
  /// See also [createJam].
  const CreateJamFamily();

  /// See also [createJam].
  CreateJamProvider call({
    required JamModel jam,
  }) {
    return CreateJamProvider(
      jam: jam,
    );
  }

  @override
  CreateJamProvider getProviderOverride(
    covariant CreateJamProvider provider,
  ) {
    return call(
      jam: provider.jam,
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
  String? get name => r'createJamProvider';
}

/// See also [createJam].
class CreateJamProvider extends AutoDisposeFutureProvider<JamModel> {
  /// See also [createJam].
  CreateJamProvider({
    required JamModel jam,
  }) : this._internal(
          (ref) => createJam(
            ref as CreateJamRef,
            jam: jam,
          ),
          from: createJamProvider,
          name: r'createJamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createJamHash,
          dependencies: CreateJamFamily._dependencies,
          allTransitiveDependencies: CreateJamFamily._allTransitiveDependencies,
          jam: jam,
        );

  CreateJamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jam,
  }) : super.internal();

  final JamModel jam;

  @override
  Override overrideWith(
    FutureOr<JamModel> Function(CreateJamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateJamProvider._internal(
        (ref) => create(ref as CreateJamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jam: jam,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<JamModel> createElement() {
    return _CreateJamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateJamProvider && other.jam == jam;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jam.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateJamRef on AutoDisposeFutureProviderRef<JamModel> {
  /// The parameter `jam` of this provider.
  JamModel get jam;
}

class _CreateJamProviderElement
    extends AutoDisposeFutureProviderElement<JamModel> with CreateJamRef {
  _CreateJamProviderElement(super.provider);

  @override
  JamModel get jam => (origin as CreateJamProvider).jam;
}

String _$deleteJamHash() => r'a2db06a5228e49c0635ffff28d6a5fa947ce36fa';

/// See also [deleteJam].
@ProviderFor(deleteJam)
const deleteJamProvider = DeleteJamFamily();

/// See also [deleteJam].
class DeleteJamFamily extends Family<AsyncValue<void>> {
  /// See also [deleteJam].
  const DeleteJamFamily();

  /// See also [deleteJam].
  DeleteJamProvider call({
    required JamModel jam,
  }) {
    return DeleteJamProvider(
      jam: jam,
    );
  }

  @override
  DeleteJamProvider getProviderOverride(
    covariant DeleteJamProvider provider,
  ) {
    return call(
      jam: provider.jam,
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
  String? get name => r'deleteJamProvider';
}

/// See also [deleteJam].
class DeleteJamProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteJam].
  DeleteJamProvider({
    required JamModel jam,
  }) : this._internal(
          (ref) => deleteJam(
            ref as DeleteJamRef,
            jam: jam,
          ),
          from: deleteJamProvider,
          name: r'deleteJamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteJamHash,
          dependencies: DeleteJamFamily._dependencies,
          allTransitiveDependencies: DeleteJamFamily._allTransitiveDependencies,
          jam: jam,
        );

  DeleteJamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jam,
  }) : super.internal();

  final JamModel jam;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteJamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteJamProvider._internal(
        (ref) => create(ref as DeleteJamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jam: jam,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteJamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteJamProvider && other.jam == jam;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jam.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteJamRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `jam` of this provider.
  JamModel get jam;
}

class _DeleteJamProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteJamRef {
  _DeleteJamProviderElement(super.provider);

  @override
  JamModel get jam => (origin as DeleteJamProvider).jam;
}

String _$getJamInvitesHash() => r'7a998e30ce5aa718cbe907b371561cf5314fc172';

/// See also [getJamInvites].
@ProviderFor(getJamInvites)
final getJamInvitesProvider = AutoDisposeFutureProvider<JamInvites>.internal(
  getJamInvites,
  name: r'getJamInvitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getJamInvitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetJamInvitesRef = AutoDisposeFutureProviderRef<JamInvites>;
String _$sendJamInvitesHash() => r'e7266654db8e18f821f069e4f14807272f6ad878';

/// See also [sendJamInvites].
@ProviderFor(sendJamInvites)
const sendJamInvitesProvider = SendJamInvitesFamily();

/// See also [sendJamInvites].
class SendJamInvitesFamily extends Family<AsyncValue<void>> {
  /// See also [sendJamInvites].
  const SendJamInvitesFamily();

  /// See also [sendJamInvites].
  SendJamInvitesProvider call({
    required int jamId,
    required List<UserProfileModel> users,
  }) {
    return SendJamInvitesProvider(
      jamId: jamId,
      users: users,
    );
  }

  @override
  SendJamInvitesProvider getProviderOverride(
    covariant SendJamInvitesProvider provider,
  ) {
    return call(
      jamId: provider.jamId,
      users: provider.users,
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
  String? get name => r'sendJamInvitesProvider';
}

/// See also [sendJamInvites].
class SendJamInvitesProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendJamInvites].
  SendJamInvitesProvider({
    required int jamId,
    required List<UserProfileModel> users,
  }) : this._internal(
          (ref) => sendJamInvites(
            ref as SendJamInvitesRef,
            jamId: jamId,
            users: users,
          ),
          from: sendJamInvitesProvider,
          name: r'sendJamInvitesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendJamInvitesHash,
          dependencies: SendJamInvitesFamily._dependencies,
          allTransitiveDependencies:
              SendJamInvitesFamily._allTransitiveDependencies,
          jamId: jamId,
          users: users,
        );

  SendJamInvitesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jamId,
    required this.users,
  }) : super.internal();

  final int jamId;
  final List<UserProfileModel> users;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendJamInvitesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendJamInvitesProvider._internal(
        (ref) => create(ref as SendJamInvitesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jamId: jamId,
        users: users,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendJamInvitesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendJamInvitesProvider &&
        other.jamId == jamId &&
        other.users == users;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);
    hash = _SystemHash.combine(hash, users.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendJamInvitesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `jamId` of this provider.
  int get jamId;

  /// The parameter `users` of this provider.
  List<UserProfileModel> get users;
}

class _SendJamInvitesProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendJamInvitesRef {
  _SendJamInvitesProviderElement(super.provider);

  @override
  int get jamId => (origin as SendJamInvitesProvider).jamId;
  @override
  List<UserProfileModel> get users => (origin as SendJamInvitesProvider).users;
}

String _$getSentJamInvitesHash() => r'69a8da2a79987fdd975fd585b89faceae93602d1';

/// See also [getSentJamInvites].
@ProviderFor(getSentJamInvites)
final getSentJamInvitesProvider =
    AutoDisposeFutureProvider<JamInvites>.internal(
  getSentJamInvites,
  name: r'getSentJamInvitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSentJamInvitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSentJamInvitesRef = AutoDisposeFutureProviderRef<JamInvites>;
String _$getSentFriendInvitesHash() =>
    r'cbfb33729df0cd119efb1d8fbb79f894b2b87276';

/// See also [getSentFriendInvites].
@ProviderFor(getSentFriendInvites)
final getSentFriendInvitesProvider =
    AutoDisposeFutureProvider<List<FriendInviteModel>>.internal(
  getSentFriendInvites,
  name: r'getSentFriendInvitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSentFriendInvitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSentFriendInvitesRef
    = AutoDisposeFutureProviderRef<List<FriendInviteModel>>;
String _$getJamParticipantsHash() =>
    r'03f738dc3d850b9e96d8b130ac62754a038118ca';

/// See also [getJamParticipants].
@ProviderFor(getJamParticipants)
const getJamParticipantsProvider = GetJamParticipantsFamily();

/// See also [getJamParticipants].
class GetJamParticipantsFamily extends Family<AsyncValue<Users>> {
  /// See also [getJamParticipants].
  const GetJamParticipantsFamily();

  /// See also [getJamParticipants].
  GetJamParticipantsProvider call({
    required int jamId,
  }) {
    return GetJamParticipantsProvider(
      jamId: jamId,
    );
  }

  @override
  GetJamParticipantsProvider getProviderOverride(
    covariant GetJamParticipantsProvider provider,
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
  String? get name => r'getJamParticipantsProvider';
}

/// See also [getJamParticipants].
class GetJamParticipantsProvider extends AutoDisposeFutureProvider<Users> {
  /// See also [getJamParticipants].
  GetJamParticipantsProvider({
    required int jamId,
  }) : this._internal(
          (ref) => getJamParticipants(
            ref as GetJamParticipantsRef,
            jamId: jamId,
          ),
          from: getJamParticipantsProvider,
          name: r'getJamParticipantsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getJamParticipantsHash,
          dependencies: GetJamParticipantsFamily._dependencies,
          allTransitiveDependencies:
              GetJamParticipantsFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  GetJamParticipantsProvider._internal(
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
    FutureOr<Users> Function(GetJamParticipantsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetJamParticipantsProvider._internal(
        (ref) => create(ref as GetJamParticipantsRef),
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
  AutoDisposeFutureProviderElement<Users> createElement() {
    return _GetJamParticipantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetJamParticipantsProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetJamParticipantsRef on AutoDisposeFutureProviderRef<Users> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _GetJamParticipantsProviderElement
    extends AutoDisposeFutureProviderElement<Users> with GetJamParticipantsRef {
  _GetJamParticipantsProviderElement(super.provider);

  @override
  int get jamId => (origin as GetJamParticipantsProvider).jamId;
}

String _$getJamInvitesAndParticipantsHash() =>
    r'17b4f6b705ea296f610ef7138c92db651a2141e2';

/// See also [getJamInvitesAndParticipants].
@ProviderFor(getJamInvitesAndParticipants)
const getJamInvitesAndParticipantsProvider =
    GetJamInvitesAndParticipantsFamily();

/// See also [getJamInvitesAndParticipants].
class GetJamInvitesAndParticipantsFamily
    extends Family<AsyncValue<(JamInvites, Users)>> {
  /// See also [getJamInvitesAndParticipants].
  const GetJamInvitesAndParticipantsFamily();

  /// See also [getJamInvitesAndParticipants].
  GetJamInvitesAndParticipantsProvider call({
    required int jamId,
  }) {
    return GetJamInvitesAndParticipantsProvider(
      jamId: jamId,
    );
  }

  @override
  GetJamInvitesAndParticipantsProvider getProviderOverride(
    covariant GetJamInvitesAndParticipantsProvider provider,
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
  String? get name => r'getJamInvitesAndParticipantsProvider';
}

/// See also [getJamInvitesAndParticipants].
class GetJamInvitesAndParticipantsProvider
    extends AutoDisposeFutureProvider<(JamInvites, Users)> {
  /// See also [getJamInvitesAndParticipants].
  GetJamInvitesAndParticipantsProvider({
    required int jamId,
  }) : this._internal(
          (ref) => getJamInvitesAndParticipants(
            ref as GetJamInvitesAndParticipantsRef,
            jamId: jamId,
          ),
          from: getJamInvitesAndParticipantsProvider,
          name: r'getJamInvitesAndParticipantsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getJamInvitesAndParticipantsHash,
          dependencies: GetJamInvitesAndParticipantsFamily._dependencies,
          allTransitiveDependencies:
              GetJamInvitesAndParticipantsFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  GetJamInvitesAndParticipantsProvider._internal(
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
    FutureOr<(JamInvites, Users)> Function(
            GetJamInvitesAndParticipantsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetJamInvitesAndParticipantsProvider._internal(
        (ref) => create(ref as GetJamInvitesAndParticipantsRef),
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
  AutoDisposeFutureProviderElement<(JamInvites, Users)> createElement() {
    return _GetJamInvitesAndParticipantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetJamInvitesAndParticipantsProvider &&
        other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetJamInvitesAndParticipantsRef
    on AutoDisposeFutureProviderRef<(JamInvites, Users)> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _GetJamInvitesAndParticipantsProviderElement
    extends AutoDisposeFutureProviderElement<(JamInvites, Users)>
    with GetJamInvitesAndParticipantsRef {
  _GetJamInvitesAndParticipantsProviderElement(super.provider);

  @override
  int get jamId => (origin as GetJamInvitesAndParticipantsProvider).jamId;
}

String _$getUsersByIdsHash() => r'4a2d926f29aa33a120aeb8012e2214ff0be1814e';

/// See also [getUsersByIds].
@ProviderFor(getUsersByIds)
const getUsersByIdsProvider = GetUsersByIdsFamily();

/// See also [getUsersByIds].
class GetUsersByIdsFamily extends Family<AsyncValue<List<UserProfileModel>>> {
  /// See also [getUsersByIds].
  const GetUsersByIdsFamily();

  /// See also [getUsersByIds].
  GetUsersByIdsProvider call({
    required List<String> userIds,
  }) {
    return GetUsersByIdsProvider(
      userIds: userIds,
    );
  }

  @override
  GetUsersByIdsProvider getProviderOverride(
    covariant GetUsersByIdsProvider provider,
  ) {
    return call(
      userIds: provider.userIds,
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
  String? get name => r'getUsersByIdsProvider';
}

/// See also [getUsersByIds].
class GetUsersByIdsProvider
    extends AutoDisposeFutureProvider<List<UserProfileModel>> {
  /// See also [getUsersByIds].
  GetUsersByIdsProvider({
    required List<String> userIds,
  }) : this._internal(
          (ref) => getUsersByIds(
            ref as GetUsersByIdsRef,
            userIds: userIds,
          ),
          from: getUsersByIdsProvider,
          name: r'getUsersByIdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUsersByIdsHash,
          dependencies: GetUsersByIdsFamily._dependencies,
          allTransitiveDependencies:
              GetUsersByIdsFamily._allTransitiveDependencies,
          userIds: userIds,
        );

  GetUsersByIdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userIds,
  }) : super.internal();

  final List<String> userIds;

  @override
  Override overrideWith(
    FutureOr<List<UserProfileModel>> Function(GetUsersByIdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUsersByIdsProvider._internal(
        (ref) => create(ref as GetUsersByIdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userIds: userIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserProfileModel>> createElement() {
    return _GetUsersByIdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUsersByIdsProvider && other.userIds == userIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUsersByIdsRef on AutoDisposeFutureProviderRef<List<UserProfileModel>> {
  /// The parameter `userIds` of this provider.
  List<String> get userIds;
}

class _GetUsersByIdsProviderElement
    extends AutoDisposeFutureProviderElement<List<UserProfileModel>>
    with GetUsersByIdsRef {
  _GetUsersByIdsProviderElement(super.provider);

  @override
  List<String> get userIds => (origin as GetUsersByIdsProvider).userIds;
}

String _$userJamControllerHash() => r'7f363ce814238f8339ae430601c6459c8fe127ab';

/// See also [UserJamController].
@ProviderFor(UserJamController)
final userJamControllerProvider =
    AutoDisposeAsyncNotifierProvider<UserJamController, Jams>.internal(
  UserJamController.new,
  name: r'userJamControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userJamControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserJamController = AutoDisposeAsyncNotifier<Jams>;
String _$jamCardViewStateHash() => r'e7770d1d346063b6943f33d2a977c75676808741';

/// See also [JamCardViewState].
@ProviderFor(JamCardViewState)
final jamCardViewStateProvider =
    AutoDisposeNotifierProvider<JamCardViewState, JamCardView>.internal(
  JamCardViewState.new,
  name: r'jamCardViewStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$jamCardViewStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$JamCardViewState = AutoDisposeNotifier<JamCardView>;
String _$jamDetailsStateHash() => r'8ff71a6b4915e967a7da677f6bbc72e5449bbe01';

abstract class _$JamDetailsState
    extends BuildlessAutoDisposeAsyncNotifier<JamModel> {
  late final int jamId;

  FutureOr<JamModel> build(
    int jamId,
  );
}

/// See also [JamDetailsState].
@ProviderFor(JamDetailsState)
const jamDetailsStateProvider = JamDetailsStateFamily();

/// See also [JamDetailsState].
class JamDetailsStateFamily extends Family<AsyncValue<JamModel>> {
  /// See also [JamDetailsState].
  const JamDetailsStateFamily();

  /// See also [JamDetailsState].
  JamDetailsStateProvider call(
    int jamId,
  ) {
    return JamDetailsStateProvider(
      jamId,
    );
  }

  @override
  JamDetailsStateProvider getProviderOverride(
    covariant JamDetailsStateProvider provider,
  ) {
    return call(
      provider.jamId,
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
  String? get name => r'jamDetailsStateProvider';
}

/// See also [JamDetailsState].
class JamDetailsStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<JamDetailsState, JamModel> {
  /// See also [JamDetailsState].
  JamDetailsStateProvider(
    int jamId,
  ) : this._internal(
          () => JamDetailsState()..jamId = jamId,
          from: jamDetailsStateProvider,
          name: r'jamDetailsStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$jamDetailsStateHash,
          dependencies: JamDetailsStateFamily._dependencies,
          allTransitiveDependencies:
              JamDetailsStateFamily._allTransitiveDependencies,
          jamId: jamId,
        );

  JamDetailsStateProvider._internal(
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
  FutureOr<JamModel> runNotifierBuild(
    covariant JamDetailsState notifier,
  ) {
    return notifier.build(
      jamId,
    );
  }

  @override
  Override overrideWith(JamDetailsState Function() create) {
    return ProviderOverride(
      origin: this,
      override: JamDetailsStateProvider._internal(
        () => create()..jamId = jamId,
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
  AutoDisposeAsyncNotifierProviderElement<JamDetailsState, JamModel>
      createElement() {
    return _JamDetailsStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is JamDetailsStateProvider && other.jamId == jamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JamDetailsStateRef on AutoDisposeAsyncNotifierProviderRef<JamModel> {
  /// The parameter `jamId` of this provider.
  int get jamId;
}

class _JamDetailsStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<JamDetailsState, JamModel>
    with JamDetailsStateRef {
  _JamDetailsStateProviderElement(super.provider);

  @override
  int get jamId => (origin as JamDetailsStateProvider).jamId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
