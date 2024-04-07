import 'package:flutter/material.dart';

import 'package:jam/domain/domain.dart';

extension MessageDeliveryStatusEnumExtension on MessageDeliveryStatus? {
  IconData toIcon() {
    if (this == null) return Icons.access_time_outlined;
    return switch (this!) {
      MessageDeliveryStatus.error => Icons.error_outline_sharp,
      MessageDeliveryStatus.read => Icons.remove_red_eye_outlined,
      MessageDeliveryStatus.sending => Icons.access_time_outlined,
      MessageDeliveryStatus.unread => Icons.done_outlined,
    };
  }
}
