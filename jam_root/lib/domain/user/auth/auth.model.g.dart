// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JUserImpl _$$JUserImplFromJson(Map<String, dynamic> json) => _$JUserImpl(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      token: json['token'] as String? ?? '',
      lastSignIn: json['lastSignIn'] == null
          ? null
          : DateTime.parse(json['lastSignIn'] as String),
      userProfile: json['userProfile'] == null
          ? null
          : UserProfileModel.fromJson(
              json['userProfile'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JUserImplToJson(_$JUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'phone': instance.phone,
      'token': instance.token,
      'lastSignIn': instance.lastSignIn?.toIso8601String(),
      'userProfile': instance.userProfile,
      'runtimeType': instance.$type,
    };

_$SignedOutImpl _$$SignedOutImplFromJson(Map<String, dynamic> json) =>
    _$SignedOutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SignedOutImplToJson(_$SignedOutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
