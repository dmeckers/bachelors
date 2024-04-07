import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam/domain/domain.dart';

part 'community.model.freezed.dart';
part 'community.model.g.dart';

@freezed
class CommunityModel with _$CommunityModel {
  const factory CommunityModel({
    required int id,
    required String name,
    required String description,
    required bool isPublic,
    required JUser owner,
    @Default([]) List<JUser> members,
    @Default([]) List<JUser> admins,
    @Default([]) List<JUser> blocked,
    @Default([]) List<ChatModel> chats,
  }) = _CommunityModel;

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);
}
