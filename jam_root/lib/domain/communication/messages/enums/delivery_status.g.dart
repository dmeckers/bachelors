// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageDeliveryStatusAdapter extends TypeAdapter<MessageDeliveryStatus> {
  @override
  final int typeId = 98;

  @override
  MessageDeliveryStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageDeliveryStatus.unread;
      case 1:
        return MessageDeliveryStatus.read;
      case 2:
        return MessageDeliveryStatus.sending;
      case 3:
        return MessageDeliveryStatus.error;
      default:
        return MessageDeliveryStatus.unread;
    }
  }

  @override
  void write(BinaryWriter writer, MessageDeliveryStatus obj) {
    switch (obj) {
      case MessageDeliveryStatus.unread:
        writer.writeByte(0);
        break;
      case MessageDeliveryStatus.read:
        writer.writeByte(1);
        break;
      case MessageDeliveryStatus.sending:
        writer.writeByte(2);
        break;
      case MessageDeliveryStatus.error:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageDeliveryStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
