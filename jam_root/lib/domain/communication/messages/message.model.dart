import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:jam/domain/domain.dart';

part 'message.model.freezed.dart';
part 'message.model.g.dart';

@freezed
abstract class MessageModel
    with _$MessageModel
    implements AbstractMessageModel, Jsonable<MessageModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 8, adapterName: 'DefaultMessageModelAdapter')
  const factory MessageModel(
      {@JsonKey(includeIfNull: false) @HiveField(0) int? id,
      @HiveField(1) int? chatId,
      @HiveField(2) String? mediaContentUrl,
      @HiveField(3) required DateTime sentAt,
      @HiveField(4) @Default(MessageType.text) MessageType messageType,
      @HiveField(5) @JsonKey(includeToJson: false) String? senderId,
      @HiveField(6) int? repliedTo,
      @HiveField(7) DateTime? editedAt,
      @HiveField(8) ForwardedFromModel? forwardedFrom,
      @HiveField(9) String? messageText,
      @HiveField(10) @JsonKey(includeToJson: false) String? senderName,
      @HiveField(11)
      @Default(MessagePinState.no_one)
      MessagePinState pinnedState,
      @Default(MessageDeliveryStatus.sending)
      MessageDeliveryStatus? messageStatus,

      ///
      /// extra field for queue in case we try to reply
      /// to a message that is not yet sent and we don't have the id
      ///
      @JsonKey(
        includeFromJson: false,
        includeToJson: false,
        includeIfNull: false,
      )
      DateTime? repliedToDate
      // @JsonKey(includeFromJson: false) UserProfileModel? sender,
      }) = _MessageModel;

  @override
  AbstractMessageModel copyWithMessageText(String messageText) {
    return copyWith(messageText: messageText);
  }

  @override
  AbstractMessageModel copyWithMediaContentUrl(String mediaContentUrl) {
    return copyWith(mediaContentUrl: mediaContentUrl);
  }

  const MessageModel._();

  bool get isEdited => editedAt != null;
  bool get isPinned => pinnedState != MessagePinState.no_one;

  @override
  bool get isTextMessage => messageType == MessageType.text;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel.fromJson(json);
  }

  // static identifier for go router codec converter
  static const jsonClassId = 'MessageModel';

  @override
  String getJsonClassId() => jsonClassId;
}
