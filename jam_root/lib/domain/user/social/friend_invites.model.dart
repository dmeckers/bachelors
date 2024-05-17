import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:jam/domain/domain.dart';

part 'friend_invites.model.g.dart';
part 'friend_invites.model.freezed.dart';

@freezed
abstract class FriendInviteModel
    with _$FriendInviteModel
    implements Jsonable<FriendInviteModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 3, adapterName: 'FriendInviteModelAdapter')
  const factory FriendInviteModel({
    @HiveField(0) required int id,
    @HiveField(1) required String userReceived,
    @HiveField(6) required String userSent,
    @HiveField(2) required String username,
    @HiveField(3) String? avatar,
    @HiveField(4) required String status,
    @HiveField(5) required DateTime sentAt,
  }) = _FriendInviteModel;

  const FriendInviteModel._();

  @override
  FriendInviteModel fromJson(Map<String, dynamic> json) =>
      FriendInviteModel.fromJson(json);

  // static identifier for go router codec converter
  static const jsonClassId = 'FriendInviteModel';

  @override
  String getJsonClassId() => jsonClassId;

  factory FriendInviteModel.fromJson(Map<String, dynamic> json) =>
      _$FriendInviteModelFromJson(json);
}
