// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JamModelAdapter extends TypeAdapter<_$JamModelImpl> {
  @override
  final int typeId = 28;

  @override
  _$JamModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$JamModelImpl(
      id: fields[0] as int?,
      creator: fields[1] as UserProfileModel?,
      creatorId: fields[2] as String?,
      description: fields[3] as String?,
      joinRequests: (fields[4] as List).cast<JamJoinRequestModel>(),
      lat: fields[5] as double?,
      lon: fields[6] as double?,
      date: fields[7] as DateTime,
      image: fields[8] as File?,
      chatId: fields[9] as int?,
      maxParticipants: fields[10] as int,
      invitesPerMember: fields[11] as int,
      extraInformation: fields[12] as String?,
      relatedCommunity: fields[13] as CommunityModel?,
      iconUrl: fields[14] as String,
      admins: (fields[15] as List).cast<UserProfileModel>(),
      participants: (fields[16] as List).cast<UserProfileModel>(),
      backgroundUrl: fields[17] as String?,
      relatedVibes: (fields[18] as List).cast<VibeModel>(),
      dropBackground: fields[19] as bool,
      joinType: fields[20] as JamJoinTypeEnum,
      formModel: fields[21] as BaseJamFormModel?,
      locationName: fields[22] as String?,
      name: fields[23] as String,
      location: fields[24] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$JamModelImpl obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creator)
      ..writeByte(2)
      ..write(obj.creatorId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.lat)
      ..writeByte(6)
      ..write(obj.lon)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.chatId)
      ..writeByte(10)
      ..write(obj.maxParticipants)
      ..writeByte(11)
      ..write(obj.invitesPerMember)
      ..writeByte(12)
      ..write(obj.extraInformation)
      ..writeByte(13)
      ..write(obj.relatedCommunity)
      ..writeByte(14)
      ..write(obj.iconUrl)
      ..writeByte(17)
      ..write(obj.backgroundUrl)
      ..writeByte(19)
      ..write(obj.dropBackground)
      ..writeByte(20)
      ..write(obj.joinType)
      ..writeByte(21)
      ..write(obj.formModel)
      ..writeByte(22)
      ..write(obj.locationName)
      ..writeByte(23)
      ..write(obj.name)
      ..writeByte(24)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.joinRequests)
      ..writeByte(15)
      ..write(obj.admins)
      ..writeByte(16)
      ..write(obj.participants)
      ..writeByte(18)
      ..write(obj.relatedVibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamModelImpl _$$JamModelImplFromJson(Map<String, dynamic> json) =>
    _$JamModelImpl(
      id: json['id'] as int?,
      creator: json['creator'] == null
          ? null
          : UserProfileModel.fromJson(json['creator'] as Map<String, dynamic>),
      creatorId: json['creator_id'] as String?,
      description: json['description'] as String? ?? 'No description this time',
      joinRequests: (json['join_requests'] as List<dynamic>?)
              ?.map((e) =>
                  JamJoinRequestModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      date: DateTime.parse(json['date'] as String),
      maxParticipants: json['max_participants'] as int,
      invitesPerMember: json['invites_per_member'] as int,
      extraInformation: json['extra_information'] as String? ?? '',
      iconUrl: json['icon_url'] as String? ?? '',
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      backgroundUrl: json['background_url'] as String?,
      relatedVibes: (json['related_vibes'] as List<dynamic>?)
              ?.map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      joinType:
          $enumDecodeNullable(_$JamJoinTypeEnumEnumMap, json['join_type']) ??
              JamJoinTypeEnum.freeToJoin,
      formModel: json['form_model'] == null
          ? null
          : BaseJamFormModel.fromJson(
              json['form_model'] as Map<String, dynamic>),
      locationName: json['location_name'] as String? ?? 'Check map',
      name: json['name'] as String,
      location: JsonJamTransformer.locationFromJson(
          JsonJamTransformer.readItself(json, 'location')),
    );

Map<String, dynamic> _$$JamModelImplToJson(_$JamModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['description'] = instance.description;
  val['date'] = instance.date.toIso8601String();
  val['max_participants'] = instance.maxParticipants;
  val['invites_per_member'] = instance.invitesPerMember;
  val['extra_information'] = instance.extraInformation;
  val['icon_url'] = instance.iconUrl;
  writeNotNull('background_url', instance.backgroundUrl);
  val['related_vibes'] = JsonVibeTransformer.vibesToIds(instance.relatedVibes);
  val['join_type'] = _$JamJoinTypeEnumEnumMap[instance.joinType]!;
  val['form_model'] = instance.formModel;
  val['location_name'] = instance.locationName;
  val['name'] = instance.name;
  val['location'] = JsonJamTransformer.locationToJson(instance.location);
  return val;
}

const _$JamJoinTypeEnumEnumMap = {
  JamJoinTypeEnum.freeToJoin: 'freeToJoin',
  JamJoinTypeEnum.invitesOnly: 'invitesOnly',
  JamJoinTypeEnum.freeToJoinAfterForm: 'freeToJoinAfterForm',
  JamJoinTypeEnum.freetoJoinAfterFormAndApprove:
      'freetoJoinAfterFormAndApprove',
  JamJoinTypeEnum.requestToJoin: 'requestToJoin',
};
