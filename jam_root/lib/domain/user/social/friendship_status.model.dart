import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam/domain/domain.dart';

part 'friendship_status.model.g.dart';
part 'friendship_status.model.freezed.dart';

@freezed
abstract class FriendShipStatusModel
    with _$FriendShipStatusModel
    implements Jsonable<FriendShipStatusModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FriendShipStatusModel({
    required RelationshipStatus status,
    required UserProfileModel profile,
    required int? receivedFriendRequestId,
    required int? sentFriendRequestId,
  }) = _FriendShipStatusModel;

  const FriendShipStatusModel._();

  @override
  FriendShipStatusModel fromJson(Map<String, dynamic> json) =>
      FriendShipStatusModel.fromJson(json);

  // static identifier for go router codec converter
  static const jsonClassId = 'FriendShipStatusModel';

  @override
  String getJsonClassId() => jsonClassId;

  factory FriendShipStatusModel.fromJson(Map<String, dynamic> json) =>
      _$FriendShipStatusModelFromJson(json);
}
