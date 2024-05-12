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

  bool get isWithForm {
    return this == JamJoinTypeEnum.freeToJoinAfterForm ||
        this == JamJoinTypeEnum.freetoJoinAfterFormAndApprove;
  }
}
