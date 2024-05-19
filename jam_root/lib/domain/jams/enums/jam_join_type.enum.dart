import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'jam_join_type.enum.g.dart';

@HiveType(typeId: 31)
enum JamJoinTypeEnum {
  @HiveField(0)
  freeToJoin,
  @HiveField(1)
  invitesOnly,
  @HiveField(2)
  freeToJoinAfterForm,
  @HiveField(3)
  freetoJoinAfterFormAndApprove,
  @HiveField(4)
  requestToJoin;

  String get title {
    return switch (this) {
      JamJoinTypeEnum.freeToJoin => 'Free to join',
      JamJoinTypeEnum.invitesOnly => 'Invites only',
      JamJoinTypeEnum.freeToJoinAfterForm => 'Free to join with registration',
      JamJoinTypeEnum.freetoJoinAfterFormAndApprove => 'Join with registration',
      JamJoinTypeEnum.requestToJoin => 'Join with request',
    };
  }

  IconData get icon {
    return switch (this) {
      JamJoinTypeEnum.freeToJoin => Icons.public,
      JamJoinTypeEnum.invitesOnly => Icons.lock,
      JamJoinTypeEnum.freeToJoinAfterForm => Icons.quiz,
      JamJoinTypeEnum.freetoJoinAfterFormAndApprove =>
        Icons.format_list_bulleted_add,
      JamJoinTypeEnum.requestToJoin => Icons.mark_unread_chat_alt_outlined,
    };
  }

  bool get isWithForm {
    return this == JamJoinTypeEnum.freeToJoinAfterForm ||
        this == JamJoinTypeEnum.freetoJoinAfterFormAndApprove;
  }
}
