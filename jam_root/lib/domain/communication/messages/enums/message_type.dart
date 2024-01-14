import 'package:hive/hive.dart';

part 'message_type.g.dart';

@HiveType(typeId: 14)
enum MessageType {
  @HiveField(0)
  text,
  @HiveField(1)
  image,
  @HiveField(2)
  video_message,
  @HiveField(3)
  audio_message,
  @HiveField(4)
  file,
  @HiveField(5)
  location,
  @HiveField(6)
  contact,
  @HiveField(7)
  sticker,
  @HiveField(8)
  gif,
  @HiveField(9)
  event;

  static MessageType parse(String type) {
    return switch (type) {
      'text' => MessageType.text,
      'image' => MessageType.image,
      'video_message' => MessageType.video_message,
      'audio_message' => MessageType.audio_message,
      'file' => MessageType.file,
      'location' => MessageType.location,
      'contact' => MessageType.contact,
      'sticker' => MessageType.sticker,
      'gif' => MessageType.gif,
      'event' => MessageType.event,
      _ => throw Exception('Invalid message type'),
    };
  }

  static String toMessageString(MessageType type) {
    return switch (type) {
      MessageType.text => 'Text message',
      MessageType.image => 'Image',
      MessageType.video_message => 'Video message',
      MessageType.audio_message => 'Audio message',
      MessageType.file => 'File',
      MessageType.location => 'Location',
      MessageType.contact => 'Contact',
      MessageType.sticker => 'Sticker',
      MessageType.gif => 'Gif',
      MessageType.event => 'event',
    };
  }
}
