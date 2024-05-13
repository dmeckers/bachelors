import 'package:flutter/material.dart';

enum JamJoinTypeEnum {
  freeToJoin,
  invitesOnly,
  freeToJoinAfterForm,
  freetoJoinAfterFormAndApprove,
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
