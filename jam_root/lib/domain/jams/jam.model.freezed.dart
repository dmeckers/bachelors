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
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  UserProfileModel? get creator => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get creatorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  String get location => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  double? get lon => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get image =>
      throw _privateConstructorUsedError; //probably will not be used in alpha version
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get chatId => throw _privateConstructorUsedError;
  @Assert('maxParticipants > -2')
  int get maxParticipants => throw _privateConstructorUsedError;
  @Assert('invitesPerMember >-2')
  int get invitesPerMember => throw _privateConstructorUsedError;
  String? get extraInformation => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  CommunityModel? get relatedCommunity =>
      throw _privateConstructorUsedError; // @Default(false) bool invitesOnly,
  @JsonKey(includeIfNull: false)
  String get iconUrl => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  List<UserProfileModel> get admins => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get backgroundUrl => throw _privateConstructorUsedError;
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
  @Assert('relatedVibes.length > 0')
  List<VibeModel> get relatedVibes => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get dropBackground => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  JamJoinTypeEnum get joinType => throw _privateConstructorUsedError;
  JamJoinRequestModel? get formModel => throw _privateConstructorUsedError;

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
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeToJson: false, includeIfNull: false)
      UserProfileModel? creator,
      @JsonKey(includeToJson: false) String? creatorId,
      String name,
      String? description,
      String? locationName,
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      String location,
      @JsonKey(includeToJson: false) double? lat,
      @JsonKey(includeToJson: false) double? lon,
      DateTime date,
      @JsonKey(includeFromJson: false, includeToJson: false) File? image,
      @JsonKey(includeFromJson: false, includeToJson: false) int? chatId,
      @Assert('maxParticipants > -2') int maxParticipants,
      @Assert('invitesPerMember >-2') int invitesPerMember,
      String? extraInformation,
      @JsonKey(includeFromJson: false, includeToJson: false)
      CommunityModel? relatedCommunity,
      @JsonKey(includeIfNull: false) String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      List<UserProfileModel> admins,
      @JsonKey(includeToJson: false, includeIfNull: false)
      List<UserProfileModel> participants,
      @JsonKey(includeIfNull: false) String? backgroundUrl,
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
      @Assert('relatedVibes.length > 0')
      List<VibeModel> relatedVibes,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool dropBackground,
      @JsonKey(includeIfNull: false) JamJoinTypeEnum joinType,
      JamJoinRequestModel? formModel});

  $UserProfileModelCopyWith<$Res>? get creator;
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  $JamJoinRequestModelCopyWith<$Res>? get formModel;
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
    Object? name = null,
    Object? description = freezed,
    Object? locationName = freezed,
    Object? location = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
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
              as JamJoinRequestModel?,
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
  $JamJoinRequestModelCopyWith<$Res>? get formModel {
    if (_value.formModel == null) {
      return null;
    }

    return $JamJoinRequestModelCopyWith<$Res>(_value.formModel!, (value) {
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
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeToJson: false, includeIfNull: false)
      UserProfileModel? creator,
      @JsonKey(includeToJson: false) String? creatorId,
      String name,
      String? description,
      String? locationName,
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      String location,
      @JsonKey(includeToJson: false) double? lat,
      @JsonKey(includeToJson: false) double? lon,
      DateTime date,
      @JsonKey(includeFromJson: false, includeToJson: false) File? image,
      @JsonKey(includeFromJson: false, includeToJson: false) int? chatId,
      @Assert('maxParticipants > -2') int maxParticipants,
      @Assert('invitesPerMember >-2') int invitesPerMember,
      String? extraInformation,
      @JsonKey(includeFromJson: false, includeToJson: false)
      CommunityModel? relatedCommunity,
      @JsonKey(includeIfNull: false) String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      List<UserProfileModel> admins,
      @JsonKey(includeToJson: false, includeIfNull: false)
      List<UserProfileModel> participants,
      @JsonKey(includeIfNull: false) String? backgroundUrl,
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
      @Assert('relatedVibes.length > 0')
      List<VibeModel> relatedVibes,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool dropBackground,
      @JsonKey(includeIfNull: false) JamJoinTypeEnum joinType,
      JamJoinRequestModel? formModel});

  @override
  $UserProfileModelCopyWith<$Res>? get creator;
  @override
  $CommunityModelCopyWith<$Res>? get relatedCommunity;
  @override
  $JamJoinRequestModelCopyWith<$Res>? get formModel;
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
    Object? name = null,
    Object? description = freezed,
    Object? locationName = freezed,
    Object? location = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
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
              as JamJoinRequestModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JamModelImpl extends _JamModel {
  const _$JamModelImpl(
      {@JsonKey(includeIfNull: false) this.id,
      @JsonKey(includeToJson: false, includeIfNull: false) this.creator,
      @JsonKey(includeToJson: false) this.creatorId,
      required this.name,
      this.description = 'No description this time',
      this.locationName = 'Check map',
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      required this.location,
      @JsonKey(includeToJson: false) this.lat,
      @JsonKey(includeToJson: false) this.lon,
      required this.date,
      @JsonKey(includeFromJson: false, includeToJson: false) this.image,
      @JsonKey(includeFromJson: false, includeToJson: false) this.chatId,
      @Assert('maxParticipants > -2') required this.maxParticipants,
      @Assert('invitesPerMember >-2') required this.invitesPerMember,
      this.extraInformation = '',
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.relatedCommunity = null,
      @JsonKey(includeIfNull: false) this.iconUrl = '',
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      final List<UserProfileModel> admins = const [],
      @JsonKey(includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> participants = const [],
      @JsonKey(includeIfNull: false) this.backgroundUrl,
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
      @Assert('relatedVibes.length > 0')
      required final List<VibeModel> relatedVibes,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.dropBackground = false,
      @JsonKey(includeIfNull: false) this.joinType = JamJoinTypeEnum.freeToJoin,
      this.formModel})
      : _admins = admins,
        _participants = participants,
        _relatedVibes = relatedVibes,
        super._();

  factory _$JamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  final UserProfileModel? creator;
  @override
  @JsonKey(includeToJson: false)
  final String? creatorId;
  @override
  final String name;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? locationName;
  @override
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  final String location;
  @override
  @JsonKey(includeToJson: false)
  final double? lat;
  @override
  @JsonKey(includeToJson: false)
  final double? lon;
  @override
  final DateTime date;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? image;
//probably will not be used in alpha version
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? chatId;
  @override
  @Assert('maxParticipants > -2')
  final int maxParticipants;
  @override
  @Assert('invitesPerMember >-2')
  final int invitesPerMember;
  @override
  @JsonKey()
  final String? extraInformation;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final CommunityModel? relatedCommunity;
// @Default(false) bool invitesOnly,
  @override
  @JsonKey(includeIfNull: false)
  final String iconUrl;
  final List<UserProfileModel> _admins;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  List<UserProfileModel> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

  final List<UserProfileModel> _participants;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  @JsonKey(includeIfNull: false)
  final String? backgroundUrl;
  final List<VibeModel> _relatedVibes;
  @override
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
  @Assert('relatedVibes.length > 0')
  List<VibeModel> get relatedVibes {
    if (_relatedVibes is EqualUnmodifiableListView) return _relatedVibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVibes);
  }

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool dropBackground;
  @override
  @JsonKey(includeIfNull: false)
  final JamJoinTypeEnum joinType;
  @override
  final JamJoinRequestModel? formModel;

  @override
  String toString() {
    return 'JamModel(id: $id, creator: $creator, creatorId: $creatorId, name: $name, description: $description, locationName: $locationName, location: $location, lat: $lat, lon: $lon, date: $date, image: $image, chatId: $chatId, maxParticipants: $maxParticipants, invitesPerMember: $invitesPerMember, extraInformation: $extraInformation, relatedCommunity: $relatedCommunity, iconUrl: $iconUrl, admins: $admins, participants: $participants, backgroundUrl: $backgroundUrl, relatedVibes: $relatedVibes, dropBackground: $dropBackground, joinType: $joinType, formModel: $formModel)';
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.location, location) ||
                other.location == location) &&
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
                other.formModel == formModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        creator,
        creatorId,
        name,
        description,
        locationName,
        location,
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
        formModel
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
      {@JsonKey(includeIfNull: false) final int? id,
      @JsonKey(includeToJson: false, includeIfNull: false)
      final UserProfileModel? creator,
      @JsonKey(includeToJson: false) final String? creatorId,
      required final String name,
      final String? description,
      final String? locationName,
      @JsonKey(
          toJson: JsonJamTransformer.locationToJson,
          fromJson: JsonJamTransformer.locationFromJson,
          readValue: JsonJamTransformer.readItself,
          includeIfNull: false)
      required final String location,
      @JsonKey(includeToJson: false) final double? lat,
      @JsonKey(includeToJson: false) final double? lon,
      required final DateTime date,
      @JsonKey(includeFromJson: false, includeToJson: false) final File? image,
      @JsonKey(includeFromJson: false, includeToJson: false) final int? chatId,
      @Assert('maxParticipants > -2') required final int maxParticipants,
      @Assert('invitesPerMember >-2') required final int invitesPerMember,
      final String? extraInformation,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final CommunityModel? relatedCommunity,
      @JsonKey(includeIfNull: false) final String iconUrl,
      @JsonKey(
          includeToJson: false, includeIfNull: false, includeFromJson: false)
      final List<UserProfileModel> admins,
      @JsonKey(includeToJson: false, includeIfNull: false)
      final List<UserProfileModel> participants,
      @JsonKey(includeIfNull: false) final String? backgroundUrl,
      @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
      @Assert('relatedVibes.length > 0')
      required final List<VibeModel> relatedVibes,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool dropBackground,
      @JsonKey(includeIfNull: false) final JamJoinTypeEnum joinType,
      final JamJoinRequestModel? formModel}) = _$JamModelImpl;
  const _JamModel._() : super._();

  factory _JamModel.fromJson(Map<String, dynamic> json) =
      _$JamModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get id;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  UserProfileModel? get creator;
  @override
  @JsonKey(includeToJson: false)
  String? get creatorId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get locationName;
  @override
  @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false)
  String get location;
  @override
  @JsonKey(includeToJson: false)
  double? get lat;
  @override
  @JsonKey(includeToJson: false)
  double? get lon;
  @override
  DateTime get date;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get image;
  @override //probably will not be used in alpha version
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get chatId;
  @override
  @Assert('maxParticipants > -2')
  int get maxParticipants;
  @override
  @Assert('invitesPerMember >-2')
  int get invitesPerMember;
  @override
  String? get extraInformation;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  CommunityModel? get relatedCommunity;
  @override // @Default(false) bool invitesOnly,
  @JsonKey(includeIfNull: false)
  String get iconUrl;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false, includeFromJson: false)
  List<UserProfileModel> get admins;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  List<UserProfileModel> get participants;
  @override
  @JsonKey(includeIfNull: false)
  String? get backgroundUrl;
  @override
  @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
  @Assert('relatedVibes.length > 0')
  List<VibeModel> get relatedVibes;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get dropBackground;
  @override
  @JsonKey(includeIfNull: false)
  JamJoinTypeEnum get joinType;
  @override
  JamJoinRequestModel? get formModel;
  @override
  @JsonKey(ignore: true)
  _$$JamModelImplCopyWith<_$JamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
