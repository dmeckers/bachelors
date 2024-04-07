import 'package:hive/hive.dart';

part 'delivery_status.g.dart';

@HiveType(typeId: 98)
enum MessageDeliveryStatus {
  @HiveField(0)
  unread,
  @HiveField(1)
  read,
  @HiveField(2)
  sending,
  @HiveField(3)
  error;

  static MessageDeliveryStatus parse(String? status) {
    if (status == null) return MessageDeliveryStatus.sending;
    return status == 'unread'
        ? MessageDeliveryStatus.unread
        : status == 'read'
            ? MessageDeliveryStatus.read
            : status == 'sending'
                ? MessageDeliveryStatus.sending
                : MessageDeliveryStatus.error;
  }
}
