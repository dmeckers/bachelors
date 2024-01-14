// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forwarded_from.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForwardedFromModelImpl _$$ForwardedFromModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForwardedFromModelImpl(
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      hideForwardedName: json['hide_forwarded_name'] as bool? ?? false,
    );

Map<String, dynamic> _$$ForwardedFromModelImplToJson(
        _$ForwardedFromModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'hide_forwarded_name': instance.hideForwardedName,
    };
