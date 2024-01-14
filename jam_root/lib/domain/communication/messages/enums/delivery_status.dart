enum MessageDeliveryStatus {
  unread,
  read,
  sending,
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
