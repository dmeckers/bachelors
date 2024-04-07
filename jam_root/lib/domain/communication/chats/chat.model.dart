import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

part 'chat.model.freezed.dart';
part 'chat.model.g.dart';

@freezed
class ChatModel
    with _$ChatModel
    implements Jsonable<ChatModel>, Identifiable<int> {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  @HiveType(typeId: 5, adapterName: 'ChatModelAdapter')
  const factory ChatModel({
    @HiveField(0) required int id,
    @HiveField(2) required UserProfileModel relatedContact,
    @HiveField(3) @Default([]) List<MessageModel> messages,
    @HiveField(6)
    @Default(0)
    @JsonKey(includeToJson: false)
    int unreadMessagesCount,
    @HiveField(7) @JsonKey(includeToJson: false) DateTime? clearedAt,
    @HiveField(8) @JsonKey(includeToJson: false) LastMessageModel? lastMessage,
    @HiveField(4)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default('')
    String iconUrl,
    @HiveField(5)
    @Default(null)
    @JsonKey(includeFromJson: false, includeToJson: false)
    PersonalChatSettingsModel? settings,
    @JsonKey(includeFromJson: false, includeToJson: false)
    ChatEventType? chatEventType,
    @HiveField(12) @Default(false) bool isPinned,
    @HiveField(13) @Default(false) bool isArchived,
    @Default(false) bool toHide,
  }) = _ChatModel;

  const ChatModel._();

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  @override
  ChatModel fromJson(Map<String, dynamic> json) {
    return ChatModel.fromJson(json);
  }

  // static identifier for go router codec converter
  static const jsonClassId = 'ChatModel';

  @override
  String getJsonClassId() => jsonClassId;
}
