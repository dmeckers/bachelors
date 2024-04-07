import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam/domain/domain.dart';

part 'chat_settings.model.freezed.dart';
part 'chat_settings.model.g.dart';

@freezed
abstract class ChatSettingsModel
    with _$ChatSettingsModel
    implements Jsonable<ChatSettingsModel> {
  const factory ChatSettingsModel.community({
    required int id,
    required ChatModel relatedChat,
    @Default([]) List<MessageModel> pinnedMessages,
  }) = CommunityChatSettingsModel;

  const factory ChatSettingsModel.personal({
    required int id,
    required ChatModel relatedChat,
    @Default([]) List<MessageModel> pinnedMessages,
  }) = PersonalChatSettingsModel;

  const factory ChatSettingsModel.group({
    required int id,
    required ChatModel relatedChat,
    @Default([]) List<MessageModel> pinnedMessages,
  }) = GroupChatSettingsModel;

  const factory ChatSettingsModel.jam({
    required int id,
    required ChatModel relatedChat,
    @Default([]) List<MessageModel> pinnedMessages,
  }) = JamChatSettingsModel;

  const ChatSettingsModel._();

  int get chatId => switch (this) {
        CommunityChatSettingsModel chat => chat.relatedChat.id,
        PersonalChatSettingsModel chat => chat.relatedChat.id,
        GroupChatSettingsModel chat => chat.relatedChat.id,
        JamChatSettingsModel chat => chat.relatedChat.id,
        _ => throw Exception('Invalid chat type'),
      };

  factory ChatSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsModelFromJson(json);

  @override
  ChatSettingsModel fromJson(Map<String, dynamic> json) {
    return ChatSettingsModel.fromJson(json);
  }

  // static identifier for go router codec converter
  static const jsonClassId = 'ChatSettingsModel';

  @override
  String getJsonClassId() => jsonClassId;
}
