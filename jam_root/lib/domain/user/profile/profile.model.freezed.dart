// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get fullName => throw _privateConstructorUsedError;

  ///
  /// Bucket links to user's photos
  ///
  @HiveField(3)
  @JsonKey(
      includeIfNull: false,
      fromJson: JsonProfileTransformer.listStub,
      includeFromJson: false,
      includeToJson: false)
  List<String>? get photoUrls => throw _privateConstructorUsedError;

  ///
  /// Checks both isonline and lastActiveAt
  /// @see lastActiveAt
  ///
  @JsonKey(includeToJson: false)
  bool get isOnline => throw _privateConstructorUsedError;
  ContactStatus get status => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get profileStatus =>
      throw _privateConstructorUsedError; // @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,
  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @HiveField(5)
  @JsonKey(includeFromJson: true, includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get friends => throw _privateConstructorUsedError;

  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<JamModel> get jams => throw _privateConstructorUsedError;

  /// Future feature
  /// @HiveField(7)
  /// @JsonKey(includeFromJson: false, includeToJson: false)
  /// @Default([])
  /// List<CommunityModel> communities,
  ///
  /// Internal collection (may in future return from database)
  ///
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ChatModel> get chats => throw _privateConstructorUsedError;

  ///
  /// User's vibes
  ///
  @HiveField(9)
  @JsonKey(includeToJson: false)
  List<VibeModel> get vibes => throw _privateConstructorUsedError;

  ///
  /// link from database to bucket main avatar
  ///
  @HiveField(10)
  String? get avatar => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(includeToJson: false)
  DateTime? get lastSignInAt => throw _privateConstructorUsedError;

  ///
  /// chat id linked to interlocutor
  ///
  @HiveField(12)
  @JsonKey(includeToJson: false)
  int? get rootChatId => throw _privateConstructorUsedError;

  ///
  /// Public key (inactive for now)
  ///
  @HiveField(13)
  @JsonKey(includeToJson: false)
  String? get publicKey => throw _privateConstructorUsedError;

  ///
  /// Last active at
  ///
  @HiveField(14)
  DateTime get lastActiveAt => throw _privateConstructorUsedError;

  ///
  /// Utility field for events
  /// @see jam_root/lib/data/realtime/communication/chats_realtime_service.dart
  /// @see jam_root/lib/presentation/communication/widgets/chats/input_bar/send_button/controller.dart
  ///
  @JsonKey(
      readValue: _ProfileJsonTransformer.readIsChatHidden,
      includeIfNull: false,
      includeToJson: false)
  bool? get isChatHidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String? username,
      @HiveField(2) String? fullName,
      @HiveField(3)
      @JsonKey(
          includeIfNull: false,
          fromJson: JsonProfileTransformer.listStub,
          includeFromJson: false,
          includeToJson: false)
      List<String>? photoUrls,
      @JsonKey(includeToJson: false) bool isOnline,
      ContactStatus status,
      @HiveField(4) String? profileStatus,
      @HiveField(5)
      @JsonKey(
          includeFromJson: true, includeToJson: false, includeIfNull: false)
      List<UserProfileModel> friends,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<JamModel> jams,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<ChatModel> chats,
      @HiveField(9) @JsonKey(includeToJson: false) List<VibeModel> vibes,
      @HiveField(10) String? avatar,
      @HiveField(11) @JsonKey(includeToJson: false) DateTime? lastSignInAt,
      @HiveField(12) @JsonKey(includeToJson: false) int? rootChatId,
      @HiveField(13) @JsonKey(includeToJson: false) String? publicKey,
      @HiveField(14) DateTime lastActiveAt,
      @JsonKey(
          readValue: _ProfileJsonTransformer.readIsChatHidden,
          includeIfNull: false,
          includeToJson: false)
      bool? isChatHidden});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? photoUrls = freezed,
    Object? isOnline = null,
    Object? status = null,
    Object? profileStatus = freezed,
    Object? friends = null,
    Object? jams = null,
    Object? chats = null,
    Object? vibes = null,
    Object? avatar = freezed,
    Object? lastSignInAt = freezed,
    Object? rootChatId = freezed,
    Object? publicKey = freezed,
    Object? lastActiveAt = null,
    Object? isChatHidden = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContactStatus,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      jams: null == jams
          ? _value.jams
          : jams // ignore: cast_nullable_to_non_nullable
              as List<JamModel>,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      vibes: null == vibes
          ? _value.vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSignInAt: freezed == lastSignInAt
          ? _value.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rootChatId: freezed == rootChatId
          ? _value.rootChatId
          : rootChatId // ignore: cast_nullable_to_non_nullable
              as int?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isChatHidden: freezed == isChatHidden
          ? _value.isChatHidden
          : isChatHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String? username,
      @HiveField(2) String? fullName,
      @HiveField(3)
      @JsonKey(
          includeIfNull: false,
          fromJson: JsonProfileTransformer.listStub,
          includeFromJson: false,
          includeToJson: false)
      List<String>? photoUrls,
      @JsonKey(includeToJson: false) bool isOnline,
      ContactStatus status,
      @HiveField(4) String? profileStatus,
      @HiveField(5)
      @JsonKey(
          includeFromJson: true, includeToJson: false, includeIfNull: false)
      List<UserProfileModel> friends,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<JamModel> jams,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<ChatModel> chats,
      @HiveField(9) @JsonKey(includeToJson: false) List<VibeModel> vibes,
      @HiveField(10) String? avatar,
      @HiveField(11) @JsonKey(includeToJson: false) DateTime? lastSignInAt,
      @HiveField(12) @JsonKey(includeToJson: false) int? rootChatId,
      @HiveField(13) @JsonKey(includeToJson: false) String? publicKey,
      @HiveField(14) DateTime lastActiveAt,
      @JsonKey(
          readValue: _ProfileJsonTransformer.readIsChatHidden,
          includeIfNull: false,
          includeToJson: false)
      bool? isChatHidden});
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? photoUrls = freezed,
    Object? isOnline = null,
    Object? status = null,
    Object? profileStatus = freezed,
    Object? friends = null,
    Object? jams = null,
    Object? chats = null,
    Object? vibes = null,
    Object? avatar = freezed,
    Object? lastSignInAt = freezed,
    Object? rootChatId = freezed,
    Object? publicKey = freezed,
    Object? lastActiveAt = null,
    Object? isChatHidden = freezed,
  }) {
    return _then(_$UserProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContactStatus,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      jams: null == jams
          ? _value._jams
          : jams // ignore: cast_nullable_to_non_nullable
              as List<JamModel>,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      vibes: null == vibes
          ? _value._vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSignInAt: freezed == lastSignInAt
          ? _value.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rootChatId: freezed == rootChatId
          ? _value.rootChatId
          : rootChatId // ignore: cast_nullable_to_non_nullable
              as int?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActiveAt: null == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isChatHidden: freezed == isChatHidden
          ? _value.isChatHidden
          : isChatHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2, adapterName: 'ProfileModelAdapter')
@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserProfileModelImpl extends _UserProfileModel {
  const _$UserProfileModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) this.username,
      @HiveField(2) this.fullName,
      @HiveField(3)
      @JsonKey(
          includeIfNull: false,
          fromJson: JsonProfileTransformer.listStub,
          includeFromJson: false,
          includeToJson: false)
      final List<String>? photoUrls = const [],
      @JsonKey(includeToJson: false) this.isOnline = false,
      this.status = ContactStatus.normal,
      @HiveField(4) this.profileStatus,
      @HiveField(5)
      @JsonKey(
          includeFromJson: true, includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> friends = const [],
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<JamModel> jams = const [],
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<ChatModel> chats = const [],
      @HiveField(9)
      @JsonKey(includeToJson: false)
      final List<VibeModel> vibes = const [],
      @HiveField(10) this.avatar,
      @HiveField(11) @JsonKey(includeToJson: false) this.lastSignInAt,
      @HiveField(12) @JsonKey(includeToJson: false) this.rootChatId,
      @HiveField(13) @JsonKey(includeToJson: false) this.publicKey,
      @HiveField(14) required this.lastActiveAt,
      @JsonKey(
          readValue: _ProfileJsonTransformer.readIsChatHidden,
          includeIfNull: false,
          includeToJson: false)
      this.isChatHidden})
      : _photoUrls = photoUrls,
        _friends = friends,
        _jams = jams,
        _chats = chats,
        _vibes = vibes,
        super._();

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String? username;
  @override
  @HiveField(2)
  final String? fullName;

  ///
  /// Bucket links to user's photos
  ///
  final List<String>? _photoUrls;

  ///
  /// Bucket links to user's photos
  ///
  @override
  @HiveField(3)
  @JsonKey(
      includeIfNull: false,
      fromJson: JsonProfileTransformer.listStub,
      includeFromJson: false,
      includeToJson: false)
  List<String>? get photoUrls {
    final value = _photoUrls;
    if (value == null) return null;
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  ///
  /// Checks both isonline and lastActiveAt
  /// @see lastActiveAt
  ///
  @override
  @JsonKey(includeToJson: false)
  final bool isOnline;
  @override
  @JsonKey()
  final ContactStatus status;
  @override
  @HiveField(4)
  final String? profileStatus;
// @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,
  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  final List<UserProfileModel> _friends;
// @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,
  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @override
  @HiveField(5)
  @JsonKey(includeFromJson: true, includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  final List<JamModel> _jams;

  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @override
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<JamModel> get jams {
    if (_jams is EqualUnmodifiableListView) return _jams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jams);
  }

  /// Future feature
  /// @HiveField(7)
  /// @JsonKey(includeFromJson: false, includeToJson: false)
  /// @Default([])
  /// List<CommunityModel> communities,
  ///
  /// Internal collection (may in future return from database)
  ///
  final List<ChatModel> _chats;

  /// Future feature
  /// @HiveField(7)
  /// @JsonKey(includeFromJson: false, includeToJson: false)
  /// @Default([])
  /// List<CommunityModel> communities,
  ///
  /// Internal collection (may in future return from database)
  ///
  @override
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  ///
  /// User's vibes
  ///
  final List<VibeModel> _vibes;

  ///
  /// User's vibes
  ///
  @override
  @HiveField(9)
  @JsonKey(includeToJson: false)
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  ///
  /// link from database to bucket main avatar
  ///
  @override
  @HiveField(10)
  final String? avatar;
  @override
  @HiveField(11)
  @JsonKey(includeToJson: false)
  final DateTime? lastSignInAt;

  ///
  /// chat id linked to interlocutor
  ///
  @override
  @HiveField(12)
  @JsonKey(includeToJson: false)
  final int? rootChatId;

  ///
  /// Public key (inactive for now)
  ///
  @override
  @HiveField(13)
  @JsonKey(includeToJson: false)
  final String? publicKey;

  ///
  /// Last active at
  ///
  @override
  @HiveField(14)
  final DateTime lastActiveAt;

  ///
  /// Utility field for events
  /// @see jam_root/lib/data/realtime/communication/chats_realtime_service.dart
  /// @see jam_root/lib/presentation/communication/widgets/chats/input_bar/send_button/controller.dart
  ///
  @override
  @JsonKey(
      readValue: _ProfileJsonTransformer.readIsChatHidden,
      includeIfNull: false,
      includeToJson: false)
  final bool? isChatHidden;

  @override
  String toString() {
    return 'UserProfileModel(id: $id, username: $username, fullName: $fullName, photoUrls: $photoUrls, isOnline: $isOnline, status: $status, profileStatus: $profileStatus, friends: $friends, jams: $jams, chats: $chats, vibes: $vibes, avatar: $avatar, lastSignInAt: $lastSignInAt, rootChatId: $rootChatId, publicKey: $publicKey, lastActiveAt: $lastActiveAt, isChatHidden: $isChatHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality().equals(other._jams, _jams) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.lastSignInAt, lastSignInAt) ||
                other.lastSignInAt == lastSignInAt) &&
            (identical(other.rootChatId, rootChatId) ||
                other.rootChatId == rootChatId) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.isChatHidden, isChatHidden) ||
                other.isChatHidden == isChatHidden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      fullName,
      const DeepCollectionEquality().hash(_photoUrls),
      isOnline,
      status,
      profileStatus,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_jams),
      const DeepCollectionEquality().hash(_chats),
      const DeepCollectionEquality().hash(_vibes),
      avatar,
      lastSignInAt,
      rootChatId,
      publicKey,
      lastActiveAt,
      isChatHidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel extends UserProfileModel {
  const factory _UserProfileModel(
      {@HiveField(0) required final String id,
      @HiveField(1) final String? username,
      @HiveField(2) final String? fullName,
      @HiveField(3)
      @JsonKey(
          includeIfNull: false,
          fromJson: JsonProfileTransformer.listStub,
          includeFromJson: false,
          includeToJson: false)
      final List<String>? photoUrls,
      @JsonKey(includeToJson: false) final bool isOnline,
      final ContactStatus status,
      @HiveField(4) final String? profileStatus,
      @HiveField(5)
      @JsonKey(
          includeFromJson: true, includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> friends,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<JamModel> jams,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<ChatModel> chats,
      @HiveField(9) @JsonKey(includeToJson: false) final List<VibeModel> vibes,
      @HiveField(10) final String? avatar,
      @HiveField(11)
      @JsonKey(includeToJson: false)
      final DateTime? lastSignInAt,
      @HiveField(12) @JsonKey(includeToJson: false) final int? rootChatId,
      @HiveField(13) @JsonKey(includeToJson: false) final String? publicKey,
      @HiveField(14) required final DateTime lastActiveAt,
      @JsonKey(
          readValue: _ProfileJsonTransformer.readIsChatHidden,
          includeIfNull: false,
          includeToJson: false)
      final bool? isChatHidden}) = _$UserProfileModelImpl;
  const _UserProfileModel._() : super._();

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String? get username;
  @override
  @HiveField(2)
  String? get fullName;
  @override

  ///
  /// Bucket links to user's photos
  ///
  @HiveField(3)
  @JsonKey(
      includeIfNull: false,
      fromJson: JsonProfileTransformer.listStub,
      includeFromJson: false,
      includeToJson: false)
  List<String>? get photoUrls;
  @override

  ///
  /// Checks both isonline and lastActiveAt
  /// @see lastActiveAt
  ///
  @JsonKey(includeToJson: false)
  bool get isOnline;
  @override
  ContactStatus get status;
  @override
  @HiveField(4)
  String? get profileStatus;
  @override // @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,
  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @HiveField(5)
  @JsonKey(includeFromJson: true, includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get friends;
  @override

  ///
  /// TODO wait wasn't this supposed to be returned from db?
  ///
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<JamModel> get jams;
  @override

  /// Future feature
  /// @HiveField(7)
  /// @JsonKey(includeFromJson: false, includeToJson: false)
  /// @Default([])
  /// List<CommunityModel> communities,
  ///
  /// Internal collection (may in future return from database)
  ///
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ChatModel> get chats;
  @override

  ///
  /// User's vibes
  ///
  @HiveField(9)
  @JsonKey(includeToJson: false)
  List<VibeModel> get vibes;
  @override

  ///
  /// link from database to bucket main avatar
  ///
  @HiveField(10)
  String? get avatar;
  @override
  @HiveField(11)
  @JsonKey(includeToJson: false)
  DateTime? get lastSignInAt;
  @override

  ///
  /// chat id linked to interlocutor
  ///
  @HiveField(12)
  @JsonKey(includeToJson: false)
  int? get rootChatId;
  @override

  ///
  /// Public key (inactive for now)
  ///
  @HiveField(13)
  @JsonKey(includeToJson: false)
  String? get publicKey;
  @override

  ///
  /// Last active at
  ///
  @HiveField(14)
  DateTime get lastActiveAt;
  @override

  ///
  /// Utility field for events
  /// @see jam_root/lib/data/realtime/communication/chats_realtime_service.dart
  /// @see jam_root/lib/presentation/communication/widgets/chats/input_bar/send_button/controller.dart
  ///
  @JsonKey(
      readValue: _ProfileJsonTransformer.readIsChatHidden,
      includeIfNull: false,
      includeToJson: false)
  bool? get isChatHidden;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
