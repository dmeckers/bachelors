// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam.model.dart';

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
      name: json['name'] as String,
      description: json['description'] as String? ?? 'No description this time',
      locationName: json['location_name'] as String? ?? 'Check map',
      location: JsonJamTransformer.locationFromJson(
          JsonJamTransformer.readItself(json, 'location')),
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
      relatedVibes: (json['related_vibes'] as List<dynamic>)
          .map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      joinType:
          $enumDecodeNullable(_$JamJoinTypeEnumEnumMap, json['join_type']) ??
              JamJoinTypeEnum.freeToJoin,
      formModel: json['form_model'] == null
          ? null
          : BaseJamFormModel.fromJson(
              json['form_model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JamModelImplToJson(_$JamModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['description'] = instance.description;
  val['location_name'] = instance.locationName;
  val['location'] = JsonJamTransformer.locationToJson(instance.location);
  val['join_requests'] = instance.joinRequests;
  val['date'] = instance.date.toIso8601String();
  val['max_participants'] = instance.maxParticipants;
  val['invites_per_member'] = instance.invitesPerMember;
  val['extra_information'] = instance.extraInformation;
  val['icon_url'] = instance.iconUrl;
  writeNotNull('background_url', instance.backgroundUrl);
  val['related_vibes'] = JsonVibeTransformer.vibesToIds(instance.relatedVibes);
  val['join_type'] = _$JamJoinTypeEnumEnumMap[instance.joinType]!;
  val['form_model'] = instance.formModel;
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
