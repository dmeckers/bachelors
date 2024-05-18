// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFriendInvitesHash() => r'6858a523b7fd2022227c2d0b236148a1f2f63f4b';

/// See also [getFriendInvites].
@ProviderFor(getFriendInvites)
final getFriendInvitesProvider =
    AutoDisposeStreamProvider<FriendInvites>.internal(
  getFriendInvites,
  name: r'getFriendInvitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFriendInvitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFriendInvitesRef = AutoDisposeStreamProviderRef<FriendInvites>;
String _$acceptFriendInviteHash() =>
    r'cbfae9b2837682ea660398b45c81235fb2dba19d';

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

/// See also [acceptFriendInvite].
@ProviderFor(acceptFriendInvite)
const acceptFriendInviteProvider = AcceptFriendInviteFamily();

/// See also [acceptFriendInvite].
class AcceptFriendInviteFamily extends Family<AsyncValue<void>> {
  /// See also [acceptFriendInvite].
  const AcceptFriendInviteFamily();

  /// See also [acceptFriendInvite].
  AcceptFriendInviteProvider call({
    required int friendInviteId,
  }) {
    return AcceptFriendInviteProvider(
      friendInviteId: friendInviteId,
    );
  }

  @override
  AcceptFriendInviteProvider getProviderOverride(
    covariant AcceptFriendInviteProvider provider,
  ) {
    return call(
      friendInviteId: provider.friendInviteId,
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
  String? get name => r'acceptFriendInviteProvider';
}

/// See also [acceptFriendInvite].
class AcceptFriendInviteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [acceptFriendInvite].
  AcceptFriendInviteProvider({
    required int friendInviteId,
  }) : this._internal(
          (ref) => acceptFriendInvite(
            ref as AcceptFriendInviteRef,
            friendInviteId: friendInviteId,
          ),
          from: acceptFriendInviteProvider,
          name: r'acceptFriendInviteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$acceptFriendInviteHash,
          dependencies: AcceptFriendInviteFamily._dependencies,
          allTransitiveDependencies:
              AcceptFriendInviteFamily._allTransitiveDependencies,
          friendInviteId: friendInviteId,
        );

  AcceptFriendInviteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.friendInviteId,
  }) : super.internal();

  final int friendInviteId;

  @override
  Override overrideWith(
    FutureOr<void> Function(AcceptFriendInviteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AcceptFriendInviteProvider._internal(
        (ref) => create(ref as AcceptFriendInviteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        friendInviteId: friendInviteId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AcceptFriendInviteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AcceptFriendInviteProvider &&
        other.friendInviteId == friendInviteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, friendInviteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AcceptFriendInviteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `friendInviteId` of this provider.
  int get friendInviteId;
}

class _AcceptFriendInviteProviderElement
    extends AutoDisposeFutureProviderElement<void> with AcceptFriendInviteRef {
  _AcceptFriendInviteProviderElement(super.provider);

  @override
  int get friendInviteId =>
      (origin as AcceptFriendInviteProvider).friendInviteId;
}

String _$rejectFriendInviteHash() =>
    r'119aa18fb7436939aeabc4ca2a38e9ba0566e594';

/// See also [rejectFriendInvite].
@ProviderFor(rejectFriendInvite)
const rejectFriendInviteProvider = RejectFriendInviteFamily();

/// See also [rejectFriendInvite].
class RejectFriendInviteFamily extends Family<AsyncValue<void>> {
  /// See also [rejectFriendInvite].
  const RejectFriendInviteFamily();

  /// See also [rejectFriendInvite].
  RejectFriendInviteProvider call({
    required int friendInviteId,
  }) {
    return RejectFriendInviteProvider(
      friendInviteId: friendInviteId,
    );
  }

  @override
  RejectFriendInviteProvider getProviderOverride(
    covariant RejectFriendInviteProvider provider,
  ) {
    return call(
      friendInviteId: provider.friendInviteId,
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
  String? get name => r'rejectFriendInviteProvider';
}

/// See also [rejectFriendInvite].
class RejectFriendInviteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [rejectFriendInvite].
  RejectFriendInviteProvider({
    required int friendInviteId,
  }) : this._internal(
          (ref) => rejectFriendInvite(
            ref as RejectFriendInviteRef,
            friendInviteId: friendInviteId,
          ),
          from: rejectFriendInviteProvider,
          name: r'rejectFriendInviteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rejectFriendInviteHash,
          dependencies: RejectFriendInviteFamily._dependencies,
          allTransitiveDependencies:
              RejectFriendInviteFamily._allTransitiveDependencies,
          friendInviteId: friendInviteId,
        );

  RejectFriendInviteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.friendInviteId,
  }) : super.internal();

  final int friendInviteId;

  @override
  Override overrideWith(
    FutureOr<void> Function(RejectFriendInviteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RejectFriendInviteProvider._internal(
        (ref) => create(ref as RejectFriendInviteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        friendInviteId: friendInviteId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RejectFriendInviteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RejectFriendInviteProvider &&
        other.friendInviteId == friendInviteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, friendInviteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RejectFriendInviteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `friendInviteId` of this provider.
  int get friendInviteId;
}

class _RejectFriendInviteProviderElement
    extends AutoDisposeFutureProviderElement<void> with RejectFriendInviteRef {
  _RejectFriendInviteProviderElement(super.provider);

  @override
  int get friendInviteId =>
      (origin as RejectFriendInviteProvider).friendInviteId;
}

String _$getFriendsHash() => r'3eeee433cf4fdbb618a14b698d78c785537c0a0f';

/// See also [getFriends].
@ProviderFor(getFriends)
final getFriendsProvider =
    AutoDisposeStreamProvider<List<UserProfileModel>>.internal(
  getFriends,
  name: r'getFriendsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getFriendsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFriendsRef = AutoDisposeStreamProviderRef<List<UserProfileModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
