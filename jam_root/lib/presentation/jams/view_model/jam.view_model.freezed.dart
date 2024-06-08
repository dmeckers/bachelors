// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam.view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JamViewModel {
  String get creatorId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get extraInformation => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get dropBackground => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  UserProfileModel? get creator => throw _privateConstructorUsedError;
  CommunityModel? get relatedCommunity => throw _privateConstructorUsedError;
  BaseJamFormModel? get formModel => throw _privateConstructorUsedError;
  List<JamJoinRequestModel> get joinRequests =>
      throw _privateConstructorUsedError;
  List<UserProfileModel> get admins => throw _privateConstructorUsedError;
  List<UserProfileModel> get participants => throw _privateConstructorUsedError;
  List<VibeModel> get relatedVibes => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  int? get chatId => throw _privateConstructorUsedError;
  int get maxParticipants => throw _privateConstructorUsedError;
  int get invitesPerMember => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  String? get backgroundUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  JamJoinTypeEnum get joinType => throw _privateConstructorUsedError;
  JamQrModeEnum get qrMode => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JamViewModelCopyWith<JamViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamViewModelCopyWith<$Res> {
  factory $JamViewModelCopyWith(
          JamViewModel value, $Res Function(JamViewModel) then) =
      _$JamViewModelCopyWithImpl<$Res, JamViewModel>;
  @useResult
  $Res call(
      {String creatorId,
      String description,
      String extraInformation,
      String locationName,
      String name,
      bool dropBackground,
      int? id,
      UserProfileModel? creator,
      CommunityModel? relatedCommunity,
      BaseJamFormModel? formModel,
      List<JamJoinRequestModel> joinRequests,
      List<UserProfileModel> admins,
      List<UserProfileModel> participants,
      List<VibeModel> relatedVibes,
      double? lat,
      double? lon,
      int? chatId,
      int maxParticipants,
      int invitesPerMember,
      String iconUrl,
      String? backgroundUrl,
      String location,
      DateTime? date,
      JamJoinTypeEnum joinType,
      JamQrModeEnum qrMode,
      File? image});

  $UserProfileModelCopyWith<$Res>? get creator;
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  $BaseJamFormModelCopyWith<$Res>? get formModel;
}

/// @nodoc
class _$JamViewModelCopyWithImpl<$Res, $Val extends JamViewModel>
    implements $JamViewModelCopyWith<$Res> {
  _$JamViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = null,
    Object? description = null,
    Object? extraInformation = null,
    Object? locationName = null,
    Object? name = null,
    Object? dropBackground = null,
    Object? id = freezed,
    Object? creator = freezed,
    Object? relatedCommunity = freezed,
    Object? formModel = freezed,
    Object? joinRequests = null,
    Object? admins = null,
    Object? participants = null,
    Object? relatedVibes = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? chatId = freezed,
    Object? maxParticipants = null,
    Object? invitesPerMember = null,
    Object? iconUrl = null,
    Object? backgroundUrl = freezed,
    Object? location = null,
    Object? date = freezed,
    Object? joinType = null,
    Object? qrMode = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extraInformation: null == extraInformation
          ? _value.extraInformation
          : extraInformation // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dropBackground: null == dropBackground
          ? _value.dropBackground
          : dropBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      relatedCommunity: freezed == relatedCommunity
          ? _value.relatedCommunity
          : relatedCommunity // ignore: cast_nullable_to_non_nullable
              as CommunityModel?,
      formModel: freezed == formModel
          ? _value.formModel
          : formModel // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
      joinRequests: null == joinRequests
          ? _value.joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<JamJoinRequestModel>,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      relatedVibes: null == relatedVibes
          ? _value.relatedVibes
          : relatedVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      invitesPerMember: null == invitesPerMember
          ? _value.invitesPerMember
          : invitesPerMember // ignore: cast_nullable_to_non_nullable
              as int,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      qrMode: null == qrMode
          ? _value.qrMode
          : qrMode // ignore: cast_nullable_to_non_nullable
              as JamQrModeEnum,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunityModelCopyWith<$Res>? get relatedCommunity {
    if (_value.relatedCommunity == null) {
      return null;
    }

    return $CommunityModelCopyWith<$Res>(_value.relatedCommunity!, (value) {
      return _then(_value.copyWith(relatedCommunity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseJamFormModelCopyWith<$Res>? get formModel {
    if (_value.formModel == null) {
      return null;
    }

    return $BaseJamFormModelCopyWith<$Res>(_value.formModel!, (value) {
      return _then(_value.copyWith(formModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JamViewModelImplCopyWith<$Res>
    implements $JamViewModelCopyWith<$Res> {
  factory _$$JamViewModelImplCopyWith(
          _$JamViewModelImpl value, $Res Function(_$JamViewModelImpl) then) =
      __$$JamViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String creatorId,
      String description,
      String extraInformation,
      String locationName,
      String name,
      bool dropBackground,
      int? id,
      UserProfileModel? creator,
      CommunityModel? relatedCommunity,
      BaseJamFormModel? formModel,
      List<JamJoinRequestModel> joinRequests,
      List<UserProfileModel> admins,
      List<UserProfileModel> participants,
      List<VibeModel> relatedVibes,
      double? lat,
      double? lon,
      int? chatId,
      int maxParticipants,
      int invitesPerMember,
      String iconUrl,
      String? backgroundUrl,
      String location,
      DateTime? date,
      JamJoinTypeEnum joinType,
      JamQrModeEnum qrMode,
      File? image});

  @override
  $UserProfileModelCopyWith<$Res>? get creator;
  @override
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  @override
  $BaseJamFormModelCopyWith<$Res>? get formModel;
}

/// @nodoc
class __$$JamViewModelImplCopyWithImpl<$Res>
    extends _$JamViewModelCopyWithImpl<$Res, _$JamViewModelImpl>
    implements _$$JamViewModelImplCopyWith<$Res> {
  __$$JamViewModelImplCopyWithImpl(
      _$JamViewModelImpl _value, $Res Function(_$JamViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = null,
    Object? description = null,
    Object? extraInformation = null,
    Object? locationName = null,
    Object? name = null,
    Object? dropBackground = null,
    Object? id = freezed,
    Object? creator = freezed,
    Object? relatedCommunity = freezed,
    Object? formModel = freezed,
    Object? joinRequests = null,
    Object? admins = null,
    Object? participants = null,
    Object? relatedVibes = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? chatId = freezed,
    Object? maxParticipants = null,
    Object? invitesPerMember = null,
    Object? iconUrl = null,
    Object? backgroundUrl = freezed,
    Object? location = null,
    Object? date = freezed,
    Object? joinType = null,
    Object? qrMode = null,
    Object? image = freezed,
  }) {
    return _then(_$JamViewModelImpl(
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      extraInformation: null == extraInformation
          ? _value.extraInformation
          : extraInformation // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dropBackground: null == dropBackground
          ? _value.dropBackground
          : dropBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      relatedCommunity: freezed == relatedCommunity
          ? _value.relatedCommunity
          : relatedCommunity // ignore: cast_nullable_to_non_nullable
              as CommunityModel?,
      formModel: freezed == formModel
          ? _value.formModel
          : formModel // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
      joinRequests: null == joinRequests
          ? _value._joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<JamJoinRequestModel>,
      admins: null == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      relatedVibes: null == relatedVibes
          ? _value._relatedVibes
          : relatedVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      invitesPerMember: null == invitesPerMember
          ? _value.invitesPerMember
          : invitesPerMember // ignore: cast_nullable_to_non_nullable
              as int,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      qrMode: null == qrMode
          ? _value.qrMode
          : qrMode // ignore: cast_nullable_to_non_nullable
              as JamQrModeEnum,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$JamViewModelImpl extends _JamViewModel {
  const _$JamViewModelImpl(
      {this.creatorId = '',
      this.description = '',
      this.extraInformation = '',
      this.locationName = '',
      this.name = '',
      this.dropBackground = false,
      this.id,
      this.creator,
      this.relatedCommunity,
      this.formModel,
      final List<JamJoinRequestModel> joinRequests = const [],
      final List<UserProfileModel> admins = const [],
      final List<UserProfileModel> participants = const [],
      final List<VibeModel> relatedVibes = const [],
      this.lat,
      this.lon,
      this.chatId,
      this.maxParticipants = -1,
      this.invitesPerMember = -1,
      this.iconUrl = '',
      this.backgroundUrl,
      this.location = '',
      this.date,
      this.joinType = JamJoinTypeEnum.freeToJoin,
      this.qrMode = JamQrModeEnum.none,
      this.image})
      : _joinRequests = joinRequests,
        _admins = admins,
        _participants = participants,
        _relatedVibes = relatedVibes,
        super._();

  @override
  @JsonKey()
  final String creatorId;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String extraInformation;
  @override
  @JsonKey()
  final String locationName;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool dropBackground;
  @override
  final int? id;
  @override
  final UserProfileModel? creator;
  @override
  final CommunityModel? relatedCommunity;
  @override
  final BaseJamFormModel? formModel;
  final List<JamJoinRequestModel> _joinRequests;
  @override
  @JsonKey()
  List<JamJoinRequestModel> get joinRequests {
    if (_joinRequests is EqualUnmodifiableListView) return _joinRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinRequests);
  }

  final List<UserProfileModel> _admins;
  @override
  @JsonKey()
  List<UserProfileModel> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

  final List<UserProfileModel> _participants;
  @override
  @JsonKey()
  List<UserProfileModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<VibeModel> _relatedVibes;
  @override
  @JsonKey()
  List<VibeModel> get relatedVibes {
    if (_relatedVibes is EqualUnmodifiableListView) return _relatedVibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVibes);
  }

  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final int? chatId;
  @override
  @JsonKey()
  final int maxParticipants;
  @override
  @JsonKey()
  final int invitesPerMember;
  @override
  @JsonKey()
  final String iconUrl;
  @override
  final String? backgroundUrl;
  @override
  @JsonKey()
  final String location;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final JamJoinTypeEnum joinType;
  @override
  @JsonKey()
  final JamQrModeEnum qrMode;
  @override
  final File? image;

  @override
  String toString() {
    return 'JamViewModel(creatorId: $creatorId, description: $description, extraInformation: $extraInformation, locationName: $locationName, name: $name, dropBackground: $dropBackground, id: $id, creator: $creator, relatedCommunity: $relatedCommunity, formModel: $formModel, joinRequests: $joinRequests, admins: $admins, participants: $participants, relatedVibes: $relatedVibes, lat: $lat, lon: $lon, chatId: $chatId, maxParticipants: $maxParticipants, invitesPerMember: $invitesPerMember, iconUrl: $iconUrl, backgroundUrl: $backgroundUrl, location: $location, date: $date, joinType: $joinType, qrMode: $qrMode, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamViewModelImpl &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extraInformation, extraInformation) ||
                other.extraInformation == extraInformation) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dropBackground, dropBackground) ||
                other.dropBackground == dropBackground) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.relatedCommunity, relatedCommunity) ||
                other.relatedCommunity == relatedCommunity) &&
            (identical(other.formModel, formModel) ||
                other.formModel == formModel) &&
            const DeepCollectionEquality()
                .equals(other._joinRequests, _joinRequests) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality()
                .equals(other._relatedVibes, _relatedVibes) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.invitesPerMember, invitesPerMember) ||
                other.invitesPerMember == invitesPerMember) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.backgroundUrl, backgroundUrl) ||
                other.backgroundUrl == backgroundUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.joinType, joinType) ||
                other.joinType == joinType) &&
            (identical(other.qrMode, qrMode) || other.qrMode == qrMode) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        creatorId,
        description,
        extraInformation,
        locationName,
        name,
        dropBackground,
        id,
        creator,
        relatedCommunity,
        formModel,
        const DeepCollectionEquality().hash(_joinRequests),
        const DeepCollectionEquality().hash(_admins),
        const DeepCollectionEquality().hash(_participants),
        const DeepCollectionEquality().hash(_relatedVibes),
        lat,
        lon,
        chatId,
        maxParticipants,
        invitesPerMember,
        iconUrl,
        backgroundUrl,
        location,
        date,
        joinType,
        qrMode,
        image
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamViewModelImplCopyWith<_$JamViewModelImpl> get copyWith =>
      __$$JamViewModelImplCopyWithImpl<_$JamViewModelImpl>(this, _$identity);
}

abstract class _JamViewModel extends JamViewModel {
  const factory _JamViewModel(
      {final String creatorId,
      final String description,
      final String extraInformation,
      final String locationName,
      final String name,
      final bool dropBackground,
      final int? id,
      final UserProfileModel? creator,
      final CommunityModel? relatedCommunity,
      final BaseJamFormModel? formModel,
      final List<JamJoinRequestModel> joinRequests,
      final List<UserProfileModel> admins,
      final List<UserProfileModel> participants,
      final List<VibeModel> relatedVibes,
      final double? lat,
      final double? lon,
      final int? chatId,
      final int maxParticipants,
      final int invitesPerMember,
      final String iconUrl,
      final String? backgroundUrl,
      final String location,
      final DateTime? date,
      final JamJoinTypeEnum joinType,
      final JamQrModeEnum qrMode,
      final File? image}) = _$JamViewModelImpl;
  const _JamViewModel._() : super._();

  @override
  String get creatorId;
  @override
  String get description;
  @override
  String get extraInformation;
  @override
  String get locationName;
  @override
  String get name;
  @override
  bool get dropBackground;
  @override
  int? get id;
  @override
  UserProfileModel? get creator;
  @override
  CommunityModel? get relatedCommunity;
  @override
  BaseJamFormModel? get formModel;
  @override
  List<JamJoinRequestModel> get joinRequests;
  @override
  List<UserProfileModel> get admins;
  @override
  List<UserProfileModel> get participants;
  @override
  List<VibeModel> get relatedVibes;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  int? get chatId;
  @override
  int get maxParticipants;
  @override
  int get invitesPerMember;
  @override
  String get iconUrl;
  @override
  String? get backgroundUrl;
  @override
  String get location;
  @override
  DateTime? get date;
  @override
  JamJoinTypeEnum get joinType;
  @override
  JamQrModeEnum get qrMode;
  @override
  File? get image;
  @override
  @JsonKey(ignore: true)
  _$$JamViewModelImplCopyWith<_$JamViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
