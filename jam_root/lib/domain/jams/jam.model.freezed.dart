// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JamModel _$JamModelFromJson(Map<String, dynamic> json) {
  return _JamModel.fromJson(json);
}

/// @nodoc
mixin _$JamModel {
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  /**
     * Creator of the jam
     */
  @HiveField(1)
  @JsonKey(includeToJson: false, includeIfNull: false)
  UserProfileModel? get creator => throw _privateConstructorUsedError;
  /**
     * Jam creator id
     */
  @HiveField(2)
  @JsonKey(includeToJson: false)
  String? get creatorId => throw _privateConstructorUsedError;
  /**
     * Description of the jam
     */
  @HiveField(3)
  String? get description => throw _privateConstructorUsedError;
  /**
     * Join requests for the jam
     */
  @HiveField(4)
  @JsonKey(includeToJson: false)
  List<JamJoinRequestModel> get joinRequests =>
      throw _privateConstructorUsedError;
  /**
     * Jam participants
     */
  @HiveField(5)
  @JsonKey(includeToJson: false)
  double? get lat => throw _privateConstructorUsedError;
  /**
     * longitude of the jam
     */
  @HiveField(6)
  @JsonKey(includeToJson: false)
  double? get lon => throw _privateConstructorUsedError;
  /**
     * Date of the jam
     */
  @HiveField(7)
  DateTime get date => throw _privateConstructorUsedError;
  /**
     * Image of the jam
     */
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get image => throw _privateConstructorUsedError;
  /**
     * probably will not be used in alpha version
     */
  @HiveField(9)
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get chatId => throw _privateConstructorUsedError;
  /**
     * Maximum number of participants
     */
  @HiveField(10)
  @Assert('maxParticipants > -2')
  int get maxParticipants => throw _privateConstructorUsedError;
  /**
     * Number of invites per member
     */
  @HiveField(11)
  @Assert('invitesPerMember >-2')
  int get invitesPerMember => throw _privateConstructorUsedError;
  /**
     * Extra information about the jam
     */
  @HiveField(12)
  String? get extraInformation => throw _privateConstructorUsedError;
  /**
     * Related community
     */
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  CommunityModel? get relatedCommunity => throw _privateConstructorUsedError;
  /**
     * Icon of the jam
     */
  @HiveField(14)
  @JsonKey(includeIfNull: false)
  String get iconUrl => throw _privateConstructorUsedError;
  /**
     * Jam admins
     */
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  @HiveField(15)
  List<UserProfileModel> get admins => throw _privateConstructorUsedError;
  /**
     * Jam participants
     */
  @HiveField(16)
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants => throw _privateConstructorUsedError;
  /**
     * Jam background
     */
  @HiveField(17)
  @JsonKey(includeIfNull: false)
  String? get backgroundUrl => throw _privateConstructorUsedError;
  /**
     * Related vibes
     */
  @HiveField(18)
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
  List<VibeModel> get relatedVibes => throw _privateConstructorUsedError;
  /**
     * Jam background
     */
  @HiveField(19)
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get dropBackground => throw _privateConstructorUsedError;
  /**
     * Jam join type
     */
  @HiveField(20)
  @JsonKey(includeIfNull: false)
  JamJoinTypeEnum get joinType => throw _privateConstructorUsedError;
  /**
     * Jam form model
     */
  @HiveField(21)
  BaseJamFormModel? get formModel => throw _privateConstructorUsedError;
  /**
     * Location name of the jam
     */
  @HiveField(22)
  String? get locationName => throw _privateConstructorUsedError;
  /**
     * Name of the jam
     */
  @HiveField(23)
  String get name => throw _privateConstructorUsedError;
  @HiveField(24)
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  String get location => throw _privateConstructorUsedError;
  @HiveField(25)
  @JsonKey(includeIfNull: false)
  JamQrModeEnum get qrMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamModelCopyWith<JamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamModelCopyWith<$Res> {
  factory $JamModelCopyWith(JamModel value, $Res Function(JamModel) then) =
      _$JamModelCopyWithImpl<$Res, JamModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) @HiveField(0) int? id,
      @HiveField(1)
      @JsonKey(includeToJson: false, includeIfNull: false)
      UserProfileModel? creator,
      @HiveField(2) @JsonKey(includeToJson: false) String? creatorId,
      @HiveField(3) String? description,
      @HiveField(4)
      @JsonKey(includeToJson: false)
      List<JamJoinRequestModel> joinRequests,
      @HiveField(5) @JsonKey(includeToJson: false) double? lat,
      @HiveField(6) @JsonKey(includeToJson: false) double? lon,
      @HiveField(7) DateTime date,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? image,
      @HiveField(9)
      @JsonKey(includeFromJson: false, includeToJson: false)
      int? chatId,
      @HiveField(10) @Assert('maxParticipants > -2') int maxParticipants,
      @HiveField(11) @Assert('invitesPerMember >-2') int invitesPerMember,
      @HiveField(12) String? extraInformation,
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      CommunityModel? relatedCommunity,
      @HiveField(14) @JsonKey(includeIfNull: false) String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      @HiveField(15)
      List<UserProfileModel> admins,
      @HiveField(16)
      @JsonKey(includeToJson: false, includeIfNull: false)
      List<UserProfileModel> participants,
      @HiveField(17) @JsonKey(includeIfNull: false) String? backgroundUrl,
      @HiveField(18)
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
      List<VibeModel> relatedVibes,
      @HiveField(19)
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool dropBackground,
      @HiveField(20) @JsonKey(includeIfNull: false) JamJoinTypeEnum joinType,
      @HiveField(21) BaseJamFormModel? formModel,
      @HiveField(22) String? locationName,
      @HiveField(23) String name,
      @HiveField(24)
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      String location,
      @HiveField(25) @JsonKey(includeIfNull: false) JamQrModeEnum qrMode});

  $UserProfileModelCopyWith<$Res>? get creator;
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  $BaseJamFormModelCopyWith<$Res>? get formModel;
}

/// @nodoc
class _$JamModelCopyWithImpl<$Res, $Val extends JamModel>
    implements $JamModelCopyWith<$Res> {
  _$JamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? creator = freezed,
    Object? creatorId = freezed,
    Object? description = freezed,
    Object? joinRequests = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? date = null,
    Object? image = freezed,
    Object? chatId = freezed,
    Object? maxParticipants = null,
    Object? invitesPerMember = null,
    Object? extraInformation = freezed,
    Object? relatedCommunity = freezed,
    Object? iconUrl = null,
    Object? admins = null,
    Object? participants = null,
    Object? backgroundUrl = freezed,
    Object? relatedVibes = null,
    Object? dropBackground = null,
    Object? joinType = null,
    Object? formModel = freezed,
    Object? locationName = freezed,
    Object? name = null,
    Object? location = null,
    Object? qrMode = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      joinRequests: null == joinRequests
          ? _value.joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<JamJoinRequestModel>,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
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
      extraInformation: freezed == extraInformation
          ? _value.extraInformation
          : extraInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCommunity: freezed == relatedCommunity
          ? _value.relatedCommunity
          : relatedCommunity // ignore: cast_nullable_to_non_nullable
              as CommunityModel?,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedVibes: null == relatedVibes
          ? _value.relatedVibes
          : relatedVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      dropBackground: null == dropBackground
          ? _value.dropBackground
          : dropBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      formModel: freezed == formModel
          ? _value.formModel
          : formModel // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      qrMode: null == qrMode
          ? _value.qrMode
          : qrMode // ignore: cast_nullable_to_non_nullable
              as JamQrModeEnum,
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
abstract class _$$JamModelImplCopyWith<$Res>
    implements $JamModelCopyWith<$Res> {
  factory _$$JamModelImplCopyWith(
          _$JamModelImpl value, $Res Function(_$JamModelImpl) then) =
      __$$JamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) @HiveField(0) int? id,
      @HiveField(1)
      @JsonKey(includeToJson: false, includeIfNull: false)
      UserProfileModel? creator,
      @HiveField(2) @JsonKey(includeToJson: false) String? creatorId,
      @HiveField(3) String? description,
      @HiveField(4)
      @JsonKey(includeToJson: false)
      List<JamJoinRequestModel> joinRequests,
      @HiveField(5) @JsonKey(includeToJson: false) double? lat,
      @HiveField(6) @JsonKey(includeToJson: false) double? lon,
      @HiveField(7) DateTime date,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? image,
      @HiveField(9)
      @JsonKey(includeFromJson: false, includeToJson: false)
      int? chatId,
      @HiveField(10) @Assert('maxParticipants > -2') int maxParticipants,
      @HiveField(11) @Assert('invitesPerMember >-2') int invitesPerMember,
      @HiveField(12) String? extraInformation,
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      CommunityModel? relatedCommunity,
      @HiveField(14) @JsonKey(includeIfNull: false) String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      @HiveField(15)
      List<UserProfileModel> admins,
      @HiveField(16)
      @JsonKey(includeToJson: false, includeIfNull: false)
      List<UserProfileModel> participants,
      @HiveField(17) @JsonKey(includeIfNull: false) String? backgroundUrl,
      @HiveField(18)
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
      List<VibeModel> relatedVibes,
      @HiveField(19)
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool dropBackground,
      @HiveField(20) @JsonKey(includeIfNull: false) JamJoinTypeEnum joinType,
      @HiveField(21) BaseJamFormModel? formModel,
      @HiveField(22) String? locationName,
      @HiveField(23) String name,
      @HiveField(24)
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      String location,
      @HiveField(25) @JsonKey(includeIfNull: false) JamQrModeEnum qrMode});

  @override
  $UserProfileModelCopyWith<$Res>? get creator;
  @override
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  @override
  $BaseJamFormModelCopyWith<$Res>? get formModel;
}

/// @nodoc
class __$$JamModelImplCopyWithImpl<$Res>
    extends _$JamModelCopyWithImpl<$Res, _$JamModelImpl>
    implements _$$JamModelImplCopyWith<$Res> {
  __$$JamModelImplCopyWithImpl(
      _$JamModelImpl _value, $Res Function(_$JamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? creator = freezed,
    Object? creatorId = freezed,
    Object? description = freezed,
    Object? joinRequests = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? date = null,
    Object? image = freezed,
    Object? chatId = freezed,
    Object? maxParticipants = null,
    Object? invitesPerMember = null,
    Object? extraInformation = freezed,
    Object? relatedCommunity = freezed,
    Object? iconUrl = null,
    Object? admins = null,
    Object? participants = null,
    Object? backgroundUrl = freezed,
    Object? relatedVibes = null,
    Object? dropBackground = null,
    Object? joinType = null,
    Object? formModel = freezed,
    Object? locationName = freezed,
    Object? name = null,
    Object? location = null,
    Object? qrMode = null,
  }) {
    return _then(_$JamModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      joinRequests: null == joinRequests
          ? _value._joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<JamJoinRequestModel>,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
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
      extraInformation: freezed == extraInformation
          ? _value.extraInformation
          : extraInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCommunity: freezed == relatedCommunity
          ? _value.relatedCommunity
          : relatedCommunity // ignore: cast_nullable_to_non_nullable
              as CommunityModel?,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      admins: null == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedVibes: null == relatedVibes
          ? _value._relatedVibes
          : relatedVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      dropBackground: null == dropBackground
          ? _value.dropBackground
          : dropBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      formModel: freezed == formModel
          ? _value.formModel
          : formModel // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      qrMode: null == qrMode
          ? _value.qrMode
          : qrMode // ignore: cast_nullable_to_non_nullable
              as JamQrModeEnum,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 28, adapterName: 'JamModelAdapter')
class _$JamModelImpl extends _JamModel {
  const _$JamModelImpl(
      {@JsonKey(includeIfNull: false) @HiveField(0) this.id,
      @HiveField(1)
      @JsonKey(includeToJson: false, includeIfNull: false)
      this.creator,
      @HiveField(2) @JsonKey(includeToJson: false) this.creatorId,
      @HiveField(3) this.description = 'No description this time',
      @HiveField(4)
      @JsonKey(includeToJson: false)
      final List<JamJoinRequestModel> joinRequests = const [],
      @HiveField(5) @JsonKey(includeToJson: false) this.lat,
      @HiveField(6) @JsonKey(includeToJson: false) this.lon,
      @HiveField(7) required this.date,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.image,
      @HiveField(9)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.chatId,
      @HiveField(10)
      @Assert('maxParticipants > -2')
      required this.maxParticipants,
      @HiveField(11)
      @Assert('invitesPerMember >-2')
      required this.invitesPerMember,
      @HiveField(12) this.extraInformation = '',
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.relatedCommunity = null,
      @HiveField(14) @JsonKey(includeIfNull: false) this.iconUrl = '',
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      @HiveField(15)
      final List<UserProfileModel> admins = const [],
      @HiveField(16)
      @JsonKey(includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> participants = const [],
      @HiveField(17) @JsonKey(includeIfNull: false) this.backgroundUrl,
      @HiveField(18)
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
      final List<VibeModel> relatedVibes = const [],
      @HiveField(19)
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.dropBackground = false,
      @HiveField(20)
      @JsonKey(includeIfNull: false)
      this.joinType = JamJoinTypeEnum.freeToJoin,
      @HiveField(21) this.formModel,
      @HiveField(22) this.locationName = 'Check map',
      @HiveField(23) required this.name,
      @HiveField(24)
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      required this.location,
      @HiveField(25)
      @JsonKey(includeIfNull: false)
      this.qrMode = JamQrModeEnum.none})
      : _joinRequests = joinRequests,
        _admins = admins,
        _participants = participants,
        _relatedVibes = relatedVibes,
        super._();

  factory _$JamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  final int? id;
/**
     * Creator of the jam
     */
  @override
  @HiveField(1)
  @JsonKey(includeToJson: false, includeIfNull: false)
  final UserProfileModel? creator;
/**
     * Jam creator id
     */
  @override
  @HiveField(2)
  @JsonKey(includeToJson: false)
  final String? creatorId;
/**
     * Description of the jam
     */
  @override
  @JsonKey()
  @HiveField(3)
  final String? description;
/**
     * Join requests for the jam
     */
  final List<JamJoinRequestModel> _joinRequests;
/**
     * Join requests for the jam
     */
  @override
  @HiveField(4)
  @JsonKey(includeToJson: false)
  List<JamJoinRequestModel> get joinRequests {
    if (_joinRequests is EqualUnmodifiableListView) return _joinRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinRequests);
  }

/**
     * Jam participants
     */
  @override
  @HiveField(5)
  @JsonKey(includeToJson: false)
  final double? lat;
/**
     * longitude of the jam
     */
  @override
  @HiveField(6)
  @JsonKey(includeToJson: false)
  final double? lon;
/**
     * Date of the jam
     */
  @override
  @HiveField(7)
  final DateTime date;
/**
     * Image of the jam
     */
  @override
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? image;
/**
     * probably will not be used in alpha version
     */
  @override
  @HiveField(9)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? chatId;
/**
     * Maximum number of participants
     */
  @override
  @HiveField(10)
  @Assert('maxParticipants > -2')
  final int maxParticipants;
/**
     * Number of invites per member
     */
  @override
  @HiveField(11)
  @Assert('invitesPerMember >-2')
  final int invitesPerMember;
/**
     * Extra information about the jam
     */
  @override
  @JsonKey()
  @HiveField(12)
  final String? extraInformation;
/**
     * Related community
     */
  @override
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final CommunityModel? relatedCommunity;
/**
     * Icon of the jam
     */
  @override
  @HiveField(14)
  @JsonKey(includeIfNull: false)
  final String iconUrl;
/**
     * Jam admins
     */
  final List<UserProfileModel> _admins;
/**
     * Jam admins
     */
  @override
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  @HiveField(15)
  List<UserProfileModel> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

/**
     * Jam participants
     */
  final List<UserProfileModel> _participants;
/**
     * Jam participants
     */
  @override
  @HiveField(16)
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

/**
     * Jam background
     */
  @override
  @HiveField(17)
  @JsonKey(includeIfNull: false)
  final String? backgroundUrl;
/**
     * Related vibes
     */
  final List<VibeModel> _relatedVibes;
/**
     * Related vibes
     */
  @override
  @HiveField(18)
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
  List<VibeModel> get relatedVibes {
    if (_relatedVibes is EqualUnmodifiableListView) return _relatedVibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVibes);
  }

/**
     * Jam background
     */
  @override
  @HiveField(19)
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool dropBackground;
/**
     * Jam join type
     */
  @override
  @HiveField(20)
  @JsonKey(includeIfNull: false)
  final JamJoinTypeEnum joinType;
/**
     * Jam form model
     */
  @override
  @HiveField(21)
  final BaseJamFormModel? formModel;
/**
     * Location name of the jam
     */
  @override
  @JsonKey()
  @HiveField(22)
  final String? locationName;
/**
     * Name of the jam
     */
  @override
  @HiveField(23)
  final String name;
  @override
  @HiveField(24)
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  final String location;
  @override
  @HiveField(25)
  @JsonKey(includeIfNull: false)
  final JamQrModeEnum qrMode;

  @override
  String toString() {
    return 'JamModel(id: $id, creator: $creator, creatorId: $creatorId, description: $description, joinRequests: $joinRequests, lat: $lat, lon: $lon, date: $date, image: $image, chatId: $chatId, maxParticipants: $maxParticipants, invitesPerMember: $invitesPerMember, extraInformation: $extraInformation, relatedCommunity: $relatedCommunity, iconUrl: $iconUrl, admins: $admins, participants: $participants, backgroundUrl: $backgroundUrl, relatedVibes: $relatedVibes, dropBackground: $dropBackground, joinType: $joinType, formModel: $formModel, locationName: $locationName, name: $name, location: $location, qrMode: $qrMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._joinRequests, _joinRequests) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.invitesPerMember, invitesPerMember) ||
                other.invitesPerMember == invitesPerMember) &&
            (identical(other.extraInformation, extraInformation) ||
                other.extraInformation == extraInformation) &&
            (identical(other.relatedCommunity, relatedCommunity) ||
                other.relatedCommunity == relatedCommunity) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.backgroundUrl, backgroundUrl) ||
                other.backgroundUrl == backgroundUrl) &&
            const DeepCollectionEquality()
                .equals(other._relatedVibes, _relatedVibes) &&
            (identical(other.dropBackground, dropBackground) ||
                other.dropBackground == dropBackground) &&
            (identical(other.joinType, joinType) ||
                other.joinType == joinType) &&
            (identical(other.formModel, formModel) ||
                other.formModel == formModel) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.qrMode, qrMode) || other.qrMode == qrMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        creator,
        creatorId,
        description,
        const DeepCollectionEquality().hash(_joinRequests),
        lat,
        lon,
        date,
        image,
        chatId,
        maxParticipants,
        invitesPerMember,
        extraInformation,
        relatedCommunity,
        iconUrl,
        const DeepCollectionEquality().hash(_admins),
        const DeepCollectionEquality().hash(_participants),
        backgroundUrl,
        const DeepCollectionEquality().hash(_relatedVibes),
        dropBackground,
        joinType,
        formModel,
        locationName,
        name,
        location,
        qrMode
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamModelImplCopyWith<_$JamModelImpl> get copyWith =>
      __$$JamModelImplCopyWithImpl<_$JamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamModelImplToJson(
      this,
    );
  }
}

abstract class _JamModel extends JamModel {
  const factory _JamModel(
      {@JsonKey(includeIfNull: false) @HiveField(0) final int? id,
      @HiveField(1)
      @JsonKey(includeToJson: false, includeIfNull: false)
      final UserProfileModel? creator,
      @HiveField(2) @JsonKey(includeToJson: false) final String? creatorId,
      @HiveField(3) final String? description,
      @HiveField(4)
      @JsonKey(includeToJson: false)
      final List<JamJoinRequestModel> joinRequests,
      @HiveField(5) @JsonKey(includeToJson: false) final double? lat,
      @HiveField(6) @JsonKey(includeToJson: false) final double? lon,
      @HiveField(7) required final DateTime date,
      @HiveField(8)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final File? image,
      @HiveField(9)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? chatId,
      @HiveField(10)
      @Assert('maxParticipants > -2')
      required final int maxParticipants,
      @HiveField(11)
      @Assert('invitesPerMember >-2')
      required final int invitesPerMember,
      @HiveField(12) final String? extraInformation,
      @HiveField(13)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final CommunityModel? relatedCommunity,
      @HiveField(14) @JsonKey(includeIfNull: false) final String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      @HiveField(15)
      final List<UserProfileModel> admins,
      @HiveField(16)
      @JsonKey(includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> participants,
      @HiveField(17) @JsonKey(includeIfNull: false) final String? backgroundUrl,
      @HiveField(18)
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
      final List<VibeModel> relatedVibes,
      @HiveField(19)
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool dropBackground,
      @HiveField(20)
      @JsonKey(includeIfNull: false)
      final JamJoinTypeEnum joinType,
      @HiveField(21) final BaseJamFormModel? formModel,
      @HiveField(22) final String? locationName,
      @HiveField(23) required final String name,
      @HiveField(24)
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      required final String location,
      @HiveField(25)
      @JsonKey(includeIfNull: false)
      final JamQrModeEnum qrMode}) = _$JamModelImpl;
  const _JamModel._() : super._();

  factory _JamModel.fromJson(Map<String, dynamic> json) =
      _$JamModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  int? get id;
  @override
  /**
     * Creator of the jam
     */
  @HiveField(1)
  @JsonKey(includeToJson: false, includeIfNull: false)
  UserProfileModel? get creator;
  @override
  /**
     * Jam creator id
     */
  @HiveField(2)
  @JsonKey(includeToJson: false)
  String? get creatorId;
  @override
  /**
     * Description of the jam
     */
  @HiveField(3)
  String? get description;
  @override
  /**
     * Join requests for the jam
     */
  @HiveField(4)
  @JsonKey(includeToJson: false)
  List<JamJoinRequestModel> get joinRequests;
  @override
  /**
     * Jam participants
     */
  @HiveField(5)
  @JsonKey(includeToJson: false)
  double? get lat;
  @override
  /**
     * longitude of the jam
     */
  @HiveField(6)
  @JsonKey(includeToJson: false)
  double? get lon;
  @override
  /**
     * Date of the jam
     */
  @HiveField(7)
  DateTime get date;
  @override
  /**
     * Image of the jam
     */
  @HiveField(8)
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get image;
  @override
  /**
     * probably will not be used in alpha version
     */
  @HiveField(9)
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get chatId;
  @override
  /**
     * Maximum number of participants
     */
  @HiveField(10)
  @Assert('maxParticipants > -2')
  int get maxParticipants;
  @override
  /**
     * Number of invites per member
     */
  @HiveField(11)
  @Assert('invitesPerMember >-2')
  int get invitesPerMember;
  @override
  /**
     * Extra information about the jam
     */
  @HiveField(12)
  String? get extraInformation;
  @override
  /**
     * Related community
     */
  @HiveField(13)
  @JsonKey(includeFromJson: false, includeToJson: false)
  CommunityModel? get relatedCommunity;
  @override
  /**
     * Icon of the jam
     */
  @HiveField(14)
  @JsonKey(includeIfNull: false)
  String get iconUrl;
  @override
  /**
     * Jam admins
     */
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  @HiveField(15)
  List<UserProfileModel> get admins;
  @override
  /**
     * Jam participants
     */
  @HiveField(16)
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants;
  @override
  /**
     * Jam background
     */
  @HiveField(17)
  @JsonKey(includeIfNull: false)
  String? get backgroundUrl;
  @override
  /**
     * Related vibes
     */
  @HiveField(18)
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
  List<VibeModel> get relatedVibes;
  @override
  /**
     * Jam background
     */
  @HiveField(19)
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get dropBackground;
  @override
  /**
     * Jam join type
     */
  @HiveField(20)
  @JsonKey(includeIfNull: false)
  JamJoinTypeEnum get joinType;
  @override
  /**
     * Jam form model
     */
  @HiveField(21)
  BaseJamFormModel? get formModel;
  @override
  /**
     * Location name of the jam
     */
  @HiveField(22)
  String? get locationName;
  @override
  /**
     * Name of the jam
     */
  @HiveField(23)
  String get name;
  @override
  @HiveField(24)
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  String get location;
  @override
  @HiveField(25)
  @JsonKey(includeIfNull: false)
  JamQrModeEnum get qrMode;
  @override
  @JsonKey(ignore: true)
  _$$JamModelImplCopyWith<_$JamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
