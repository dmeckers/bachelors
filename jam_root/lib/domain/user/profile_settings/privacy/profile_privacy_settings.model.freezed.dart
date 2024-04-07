// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_privacy_settings.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfilePrivacySettingsModel _$UserProfilePrivacySettingsModelFromJson(
    Map<String, dynamic> json) {
  return _UserProfilePrivacySettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfilePrivacySettingsModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(includeFromJson: false)
  bool get twoStepAuthEnabled => throw _privateConstructorUsedError;
  @HiveField(2)
  PrivacyBoundaries get displayLastSeenVisibility =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  PrivacyBoundaries get mapVisibility => throw _privateConstructorUsedError;
  @HiveField(4)
  PrivacyBoundaries get canBeFoundByPhone => throw _privateConstructorUsedError;
  @HiveField(5)
  @HiveField(6)
  PrivacyBoundaries get canBeInvitedToCommunities =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  PrivacyBoundaries get canBeInvitedToJams =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  PrivacyBoundaries get aboutMeVisiblity => throw _privateConstructorUsedError;
  @HiveField(9)
  PrivacyBoundaries get phoneVisiblity => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(includeIfNull: false)
  List<UserProfileModel> get visibleOnMapToUserList =>
      throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToCommunitesUserList =>
      throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToJamsUserList =>
      throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get aboutMeVisibilityJamsUserList =>
      throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get phoneVisibilityJamsUserList =>
      throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get displayLastSeenVisibilityWhitelist =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfilePrivacySettingsModelCopyWith<UserProfilePrivacySettingsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilePrivacySettingsModelCopyWith<$Res> {
  factory $UserProfilePrivacySettingsModelCopyWith(
          UserProfilePrivacySettingsModel value,
          $Res Function(UserProfilePrivacySettingsModel) then) =
      _$UserProfilePrivacySettingsModelCopyWithImpl<$Res,
          UserProfilePrivacySettingsModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(includeFromJson: false) bool twoStepAuthEnabled,
      @HiveField(2) PrivacyBoundaries displayLastSeenVisibility,
      @HiveField(3) PrivacyBoundaries mapVisibility,
      @HiveField(4) PrivacyBoundaries canBeFoundByPhone,
      @HiveField(5) @HiveField(6) PrivacyBoundaries canBeInvitedToCommunities,
      @HiveField(7) PrivacyBoundaries canBeInvitedToJams,
      @HiveField(8) PrivacyBoundaries aboutMeVisiblity,
      @HiveField(9) PrivacyBoundaries phoneVisiblity,
      @HiveField(10)
      @JsonKey(includeIfNull: false)
      List<UserProfileModel> visibleOnMapToUserList,
      @HiveField(11)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> invitableToCommunitesUserList,
      @HiveField(12)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> invitableToJamsUserList,
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> aboutMeVisibilityJamsUserList,
      @HiveField(14)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> phoneVisibilityJamsUserList,
      @HiveField(15)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> displayLastSeenVisibilityWhitelist});
}

/// @nodoc
class _$UserProfilePrivacySettingsModelCopyWithImpl<$Res,
        $Val extends UserProfilePrivacySettingsModel>
    implements $UserProfilePrivacySettingsModelCopyWith<$Res> {
  _$UserProfilePrivacySettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? twoStepAuthEnabled = null,
    Object? displayLastSeenVisibility = null,
    Object? mapVisibility = null,
    Object? canBeFoundByPhone = null,
    Object? canBeInvitedToCommunities = null,
    Object? canBeInvitedToJams = null,
    Object? aboutMeVisiblity = null,
    Object? phoneVisiblity = null,
    Object? visibleOnMapToUserList = null,
    Object? invitableToCommunitesUserList = null,
    Object? invitableToJamsUserList = null,
    Object? aboutMeVisibilityJamsUserList = null,
    Object? phoneVisibilityJamsUserList = null,
    Object? displayLastSeenVisibilityWhitelist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      twoStepAuthEnabled: null == twoStepAuthEnabled
          ? _value.twoStepAuthEnabled
          : twoStepAuthEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      displayLastSeenVisibility: null == displayLastSeenVisibility
          ? _value.displayLastSeenVisibility
          : displayLastSeenVisibility // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      mapVisibility: null == mapVisibility
          ? _value.mapVisibility
          : mapVisibility // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeFoundByPhone: null == canBeFoundByPhone
          ? _value.canBeFoundByPhone
          : canBeFoundByPhone // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeInvitedToCommunities: null == canBeInvitedToCommunities
          ? _value.canBeInvitedToCommunities
          : canBeInvitedToCommunities // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeInvitedToJams: null == canBeInvitedToJams
          ? _value.canBeInvitedToJams
          : canBeInvitedToJams // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      aboutMeVisiblity: null == aboutMeVisiblity
          ? _value.aboutMeVisiblity
          : aboutMeVisiblity // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      phoneVisiblity: null == phoneVisiblity
          ? _value.phoneVisiblity
          : phoneVisiblity // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      visibleOnMapToUserList: null == visibleOnMapToUserList
          ? _value.visibleOnMapToUserList
          : visibleOnMapToUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      invitableToCommunitesUserList: null == invitableToCommunitesUserList
          ? _value.invitableToCommunitesUserList
          : invitableToCommunitesUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      invitableToJamsUserList: null == invitableToJamsUserList
          ? _value.invitableToJamsUserList
          : invitableToJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      aboutMeVisibilityJamsUserList: null == aboutMeVisibilityJamsUserList
          ? _value.aboutMeVisibilityJamsUserList
          : aboutMeVisibilityJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      phoneVisibilityJamsUserList: null == phoneVisibilityJamsUserList
          ? _value.phoneVisibilityJamsUserList
          : phoneVisibilityJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      displayLastSeenVisibilityWhitelist: null ==
              displayLastSeenVisibilityWhitelist
          ? _value.displayLastSeenVisibilityWhitelist
          : displayLastSeenVisibilityWhitelist // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfilePrivacySettingsModelImplCopyWith<$Res>
    implements $UserProfilePrivacySettingsModelCopyWith<$Res> {
  factory _$$UserProfilePrivacySettingsModelImplCopyWith(
          _$UserProfilePrivacySettingsModelImpl value,
          $Res Function(_$UserProfilePrivacySettingsModelImpl) then) =
      __$$UserProfilePrivacySettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(includeFromJson: false) bool twoStepAuthEnabled,
      @HiveField(2) PrivacyBoundaries displayLastSeenVisibility,
      @HiveField(3) PrivacyBoundaries mapVisibility,
      @HiveField(4) PrivacyBoundaries canBeFoundByPhone,
      @HiveField(5) @HiveField(6) PrivacyBoundaries canBeInvitedToCommunities,
      @HiveField(7) PrivacyBoundaries canBeInvitedToJams,
      @HiveField(8) PrivacyBoundaries aboutMeVisiblity,
      @HiveField(9) PrivacyBoundaries phoneVisiblity,
      @HiveField(10)
      @JsonKey(includeIfNull: false)
      List<UserProfileModel> visibleOnMapToUserList,
      @HiveField(11)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> invitableToCommunitesUserList,
      @HiveField(12)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> invitableToJamsUserList,
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> aboutMeVisibilityJamsUserList,
      @HiveField(14)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> phoneVisibilityJamsUserList,
      @HiveField(15)
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<UserProfileModel> displayLastSeenVisibilityWhitelist});
}

/// @nodoc
class __$$UserProfilePrivacySettingsModelImplCopyWithImpl<$Res>
    extends _$UserProfilePrivacySettingsModelCopyWithImpl<$Res,
        _$UserProfilePrivacySettingsModelImpl>
    implements _$$UserProfilePrivacySettingsModelImplCopyWith<$Res> {
  __$$UserProfilePrivacySettingsModelImplCopyWithImpl(
      _$UserProfilePrivacySettingsModelImpl _value,
      $Res Function(_$UserProfilePrivacySettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? twoStepAuthEnabled = null,
    Object? displayLastSeenVisibility = null,
    Object? mapVisibility = null,
    Object? canBeFoundByPhone = null,
    Object? canBeInvitedToCommunities = null,
    Object? canBeInvitedToJams = null,
    Object? aboutMeVisiblity = null,
    Object? phoneVisiblity = null,
    Object? visibleOnMapToUserList = null,
    Object? invitableToCommunitesUserList = null,
    Object? invitableToJamsUserList = null,
    Object? aboutMeVisibilityJamsUserList = null,
    Object? phoneVisibilityJamsUserList = null,
    Object? displayLastSeenVisibilityWhitelist = null,
  }) {
    return _then(_$UserProfilePrivacySettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      twoStepAuthEnabled: null == twoStepAuthEnabled
          ? _value.twoStepAuthEnabled
          : twoStepAuthEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      displayLastSeenVisibility: null == displayLastSeenVisibility
          ? _value.displayLastSeenVisibility
          : displayLastSeenVisibility // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      mapVisibility: null == mapVisibility
          ? _value.mapVisibility
          : mapVisibility // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeFoundByPhone: null == canBeFoundByPhone
          ? _value.canBeFoundByPhone
          : canBeFoundByPhone // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeInvitedToCommunities: null == canBeInvitedToCommunities
          ? _value.canBeInvitedToCommunities
          : canBeInvitedToCommunities // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      canBeInvitedToJams: null == canBeInvitedToJams
          ? _value.canBeInvitedToJams
          : canBeInvitedToJams // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      aboutMeVisiblity: null == aboutMeVisiblity
          ? _value.aboutMeVisiblity
          : aboutMeVisiblity // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      phoneVisiblity: null == phoneVisiblity
          ? _value.phoneVisiblity
          : phoneVisiblity // ignore: cast_nullable_to_non_nullable
              as PrivacyBoundaries,
      visibleOnMapToUserList: null == visibleOnMapToUserList
          ? _value._visibleOnMapToUserList
          : visibleOnMapToUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      invitableToCommunitesUserList: null == invitableToCommunitesUserList
          ? _value._invitableToCommunitesUserList
          : invitableToCommunitesUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      invitableToJamsUserList: null == invitableToJamsUserList
          ? _value._invitableToJamsUserList
          : invitableToJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      aboutMeVisibilityJamsUserList: null == aboutMeVisibilityJamsUserList
          ? _value._aboutMeVisibilityJamsUserList
          : aboutMeVisibilityJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      phoneVisibilityJamsUserList: null == phoneVisibilityJamsUserList
          ? _value._phoneVisibilityJamsUserList
          : phoneVisibilityJamsUserList // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      displayLastSeenVisibilityWhitelist: null ==
              displayLastSeenVisibilityWhitelist
          ? _value._displayLastSeenVisibilityWhitelist
          : displayLastSeenVisibilityWhitelist // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 25, adapterName: 'UserProfilePrivacySettingsModelAdapter')
class _$UserProfilePrivacySettingsModelImpl
    implements _UserProfilePrivacySettingsModel {
  const _$UserProfilePrivacySettingsModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1)
      @JsonKey(includeFromJson: false)
      this.twoStepAuthEnabled = false,
      @HiveField(2) this.displayLastSeenVisibility = PrivacyBoundaries.everyone,
      @HiveField(3) this.mapVisibility = PrivacyBoundaries.everyone,
      @HiveField(4) this.canBeFoundByPhone = PrivacyBoundaries.everyone,
      @HiveField(5)
      @HiveField(6)
      this.canBeInvitedToCommunities = PrivacyBoundaries.everyone,
      @HiveField(7) this.canBeInvitedToJams = PrivacyBoundaries.everyone,
      @HiveField(8) this.aboutMeVisiblity = PrivacyBoundaries.everyone,
      @HiveField(9) this.phoneVisiblity = PrivacyBoundaries.everyone,
      @HiveField(10)
      @JsonKey(includeIfNull: false)
      final List<UserProfileModel> visibleOnMapToUserList = const [],
      @HiveField(11)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<UserProfileModel> invitableToCommunitesUserList = const [],
      @HiveField(12)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<UserProfileModel> invitableToJamsUserList = const [],
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<UserProfileModel> aboutMeVisibilityJamsUserList = const [],
      @HiveField(14)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<UserProfileModel> phoneVisibilityJamsUserList = const [],
      @HiveField(15)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<UserProfileModel> displayLastSeenVisibilityWhitelist =
          const []})
      : _visibleOnMapToUserList = visibleOnMapToUserList,
        _invitableToCommunitesUserList = invitableToCommunitesUserList,
        _invitableToJamsUserList = invitableToJamsUserList,
        _aboutMeVisibilityJamsUserList = aboutMeVisibilityJamsUserList,
        _phoneVisibilityJamsUserList = phoneVisibilityJamsUserList,
        _displayLastSeenVisibilityWhitelist =
            displayLastSeenVisibilityWhitelist;

  factory _$UserProfilePrivacySettingsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserProfilePrivacySettingsModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(includeFromJson: false)
  final bool twoStepAuthEnabled;
  @override
  @JsonKey()
  @HiveField(2)
  final PrivacyBoundaries displayLastSeenVisibility;
  @override
  @JsonKey()
  @HiveField(3)
  final PrivacyBoundaries mapVisibility;
  @override
  @JsonKey()
  @HiveField(4)
  final PrivacyBoundaries canBeFoundByPhone;
  @override
  @JsonKey()
  @HiveField(5)
  @HiveField(6)
  final PrivacyBoundaries canBeInvitedToCommunities;
  @override
  @JsonKey()
  @HiveField(7)
  final PrivacyBoundaries canBeInvitedToJams;
  @override
  @JsonKey()
  @HiveField(8)
  final PrivacyBoundaries aboutMeVisiblity;
  @override
  @JsonKey()
  @HiveField(9)
  final PrivacyBoundaries phoneVisiblity;
  final List<UserProfileModel> _visibleOnMapToUserList;
  @override
  @HiveField(10)
  @JsonKey(includeIfNull: false)
  List<UserProfileModel> get visibleOnMapToUserList {
    if (_visibleOnMapToUserList is EqualUnmodifiableListView)
      return _visibleOnMapToUserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleOnMapToUserList);
  }

  final List<UserProfileModel> _invitableToCommunitesUserList;
  @override
  @HiveField(11)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToCommunitesUserList {
    if (_invitableToCommunitesUserList is EqualUnmodifiableListView)
      return _invitableToCommunitesUserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitableToCommunitesUserList);
  }

  final List<UserProfileModel> _invitableToJamsUserList;
  @override
  @HiveField(12)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToJamsUserList {
    if (_invitableToJamsUserList is EqualUnmodifiableListView)
      return _invitableToJamsUserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitableToJamsUserList);
  }

  final List<UserProfileModel> _aboutMeVisibilityJamsUserList;
  @override
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get aboutMeVisibilityJamsUserList {
    if (_aboutMeVisibilityJamsUserList is EqualUnmodifiableListView)
      return _aboutMeVisibilityJamsUserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aboutMeVisibilityJamsUserList);
  }

  final List<UserProfileModel> _phoneVisibilityJamsUserList;
  @override
  @HiveField(14)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get phoneVisibilityJamsUserList {
    if (_phoneVisibilityJamsUserList is EqualUnmodifiableListView)
      return _phoneVisibilityJamsUserList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phoneVisibilityJamsUserList);
  }

  final List<UserProfileModel> _displayLastSeenVisibilityWhitelist;
  @override
  @HiveField(15)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get displayLastSeenVisibilityWhitelist {
    if (_displayLastSeenVisibilityWhitelist is EqualUnmodifiableListView)
      return _displayLastSeenVisibilityWhitelist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayLastSeenVisibilityWhitelist);
  }

  @override
  String toString() {
    return 'UserProfilePrivacySettingsModel(id: $id, twoStepAuthEnabled: $twoStepAuthEnabled, displayLastSeenVisibility: $displayLastSeenVisibility, mapVisibility: $mapVisibility, canBeFoundByPhone: $canBeFoundByPhone, canBeInvitedToCommunities: $canBeInvitedToCommunities, canBeInvitedToJams: $canBeInvitedToJams, aboutMeVisiblity: $aboutMeVisiblity, phoneVisiblity: $phoneVisiblity, visibleOnMapToUserList: $visibleOnMapToUserList, invitableToCommunitesUserList: $invitableToCommunitesUserList, invitableToJamsUserList: $invitableToJamsUserList, aboutMeVisibilityJamsUserList: $aboutMeVisibilityJamsUserList, phoneVisibilityJamsUserList: $phoneVisibilityJamsUserList, displayLastSeenVisibilityWhitelist: $displayLastSeenVisibilityWhitelist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfilePrivacySettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.twoStepAuthEnabled, twoStepAuthEnabled) ||
                other.twoStepAuthEnabled == twoStepAuthEnabled) &&
            (identical(other.displayLastSeenVisibility,
                    displayLastSeenVisibility) ||
                other.displayLastSeenVisibility == displayLastSeenVisibility) &&
            (identical(other.mapVisibility, mapVisibility) ||
                other.mapVisibility == mapVisibility) &&
            (identical(other.canBeFoundByPhone, canBeFoundByPhone) ||
                other.canBeFoundByPhone == canBeFoundByPhone) &&
            (identical(other.canBeInvitedToCommunities,
                    canBeInvitedToCommunities) ||
                other.canBeInvitedToCommunities == canBeInvitedToCommunities) &&
            (identical(other.canBeInvitedToJams, canBeInvitedToJams) ||
                other.canBeInvitedToJams == canBeInvitedToJams) &&
            (identical(other.aboutMeVisiblity, aboutMeVisiblity) ||
                other.aboutMeVisiblity == aboutMeVisiblity) &&
            (identical(other.phoneVisiblity, phoneVisiblity) ||
                other.phoneVisiblity == phoneVisiblity) &&
            const DeepCollectionEquality().equals(
                other._visibleOnMapToUserList, _visibleOnMapToUserList) &&
            const DeepCollectionEquality().equals(
                other._invitableToCommunitesUserList,
                _invitableToCommunitesUserList) &&
            const DeepCollectionEquality().equals(
                other._invitableToJamsUserList, _invitableToJamsUserList) &&
            const DeepCollectionEquality().equals(
                other._aboutMeVisibilityJamsUserList,
                _aboutMeVisibilityJamsUserList) &&
            const DeepCollectionEquality().equals(
                other._phoneVisibilityJamsUserList,
                _phoneVisibilityJamsUserList) &&
            const DeepCollectionEquality().equals(
                other._displayLastSeenVisibilityWhitelist,
                _displayLastSeenVisibilityWhitelist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      twoStepAuthEnabled,
      displayLastSeenVisibility,
      mapVisibility,
      canBeFoundByPhone,
      canBeInvitedToCommunities,
      canBeInvitedToJams,
      aboutMeVisiblity,
      phoneVisiblity,
      const DeepCollectionEquality().hash(_visibleOnMapToUserList),
      const DeepCollectionEquality().hash(_invitableToCommunitesUserList),
      const DeepCollectionEquality().hash(_invitableToJamsUserList),
      const DeepCollectionEquality().hash(_aboutMeVisibilityJamsUserList),
      const DeepCollectionEquality().hash(_phoneVisibilityJamsUserList),
      const DeepCollectionEquality().hash(_displayLastSeenVisibilityWhitelist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfilePrivacySettingsModelImplCopyWith<
          _$UserProfilePrivacySettingsModelImpl>
      get copyWith => __$$UserProfilePrivacySettingsModelImplCopyWithImpl<
          _$UserProfilePrivacySettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfilePrivacySettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfilePrivacySettingsModel
    implements UserProfilePrivacySettingsModel {
  const factory _UserProfilePrivacySettingsModel(
          {@HiveField(0) required final String id,
          @HiveField(1)
          @JsonKey(includeFromJson: false)
          final bool twoStepAuthEnabled,
          @HiveField(2) final PrivacyBoundaries displayLastSeenVisibility,
          @HiveField(3) final PrivacyBoundaries mapVisibility,
          @HiveField(4) final PrivacyBoundaries canBeFoundByPhone,
          @HiveField(5)
          @HiveField(6)
          final PrivacyBoundaries canBeInvitedToCommunities,
          @HiveField(7) final PrivacyBoundaries canBeInvitedToJams,
          @HiveField(8) final PrivacyBoundaries aboutMeVisiblity,
          @HiveField(9) final PrivacyBoundaries phoneVisiblity,
          @HiveField(10)
          @JsonKey(includeIfNull: false)
          final List<UserProfileModel> visibleOnMapToUserList,
          @HiveField(11)
          @JsonKey(includeFromJson: false, includeToJson: false)
          final List<UserProfileModel> invitableToCommunitesUserList,
          @HiveField(12)
          @JsonKey(includeFromJson: false, includeToJson: false)
          final List<UserProfileModel> invitableToJamsUserList,
          @HiveField(13)
          @JsonKey(includeFromJson: false, includeToJson: false)
          final List<UserProfileModel> aboutMeVisibilityJamsUserList,
          @HiveField(14)
          @JsonKey(includeFromJson: false, includeToJson: false)
          final List<UserProfileModel> phoneVisibilityJamsUserList,
          @HiveField(15)
          @JsonKey(includeFromJson: false, includeToJson: false)
          final List<UserProfileModel> displayLastSeenVisibilityWhitelist}) =
      _$UserProfilePrivacySettingsModelImpl;

  factory _UserProfilePrivacySettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserProfilePrivacySettingsModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(includeFromJson: false)
  bool get twoStepAuthEnabled;
  @override
  @HiveField(2)
  PrivacyBoundaries get displayLastSeenVisibility;
  @override
  @HiveField(3)
  PrivacyBoundaries get mapVisibility;
  @override
  @HiveField(4)
  PrivacyBoundaries get canBeFoundByPhone;
  @override
  @HiveField(5)
  @HiveField(6)
  PrivacyBoundaries get canBeInvitedToCommunities;
  @override
  @HiveField(7)
  PrivacyBoundaries get canBeInvitedToJams;
  @override
  @HiveField(8)
  PrivacyBoundaries get aboutMeVisiblity;
  @override
  @HiveField(9)
  PrivacyBoundaries get phoneVisiblity;
  @override
  @HiveField(10)
  @JsonKey(includeIfNull: false)
  List<UserProfileModel> get visibleOnMapToUserList;
  @override
  @HiveField(11)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToCommunitesUserList;
  @override
  @HiveField(12)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get invitableToJamsUserList;
  @override
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get aboutMeVisibilityJamsUserList;
  @override
  @HiveField(14)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get phoneVisibilityJamsUserList;
  @override
  @HiveField(15)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<UserProfileModel> get displayLastSeenVisibilityWhitelist;
  @override
  @JsonKey(ignore: true)
  _$$UserProfilePrivacySettingsModelImplCopyWith<
          _$UserProfilePrivacySettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
