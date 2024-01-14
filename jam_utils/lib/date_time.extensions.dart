import 'package:flutter/material.dart';

_pluralize(int count, String singular, [String? plural]) {
  plural ??= '${singular}s';
  return count == 1 ? singular : plural;
}

extension DateTimeConverter on DateTime {
  String toNTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} ${_pluralize((difference.inDays / 365).floor(), 'year')} ago';
    }
    if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} ${_pluralize((difference.inDays / 30).floor(), 'month')} ago';
    }
    if (difference.inDays > 7) {
      return '${(difference.inDays / 7).floor()} ${_pluralize((difference.inDays / 7).floor(), 'week')} ago';
    }
    if (difference.inDays > 0) {
      return '${difference.inDays} ${_pluralize(difference.inDays, 'day')} ago';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours} ${_pluralize(difference.inHours, 'hour')} ago';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${_pluralize(difference.inMinutes, 'minute')} ago';
    }
    if (difference.inSeconds > 5) {
      return '${difference.inSeconds} ${_pluralize(difference.inSeconds, 'second')} ago';
    }
    return 'just now';
  }

  String toTime() =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

  bool isOtherDay(DateTime other) =>
      year != other.year || month != other.month || day != other.day;

  bool get hasNoTime => hour == 0 && minute == 0;

  String get timePartString =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

  String get datePartString =>
      "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.${year.toString().padLeft(2, '0')}";

  DateTime setTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String format(String format) {
    return format
        .replaceAll('dd', day.toString().padLeft(2, '0'))
        .replaceAll('mm', month.toString().padLeft(2, '0'))
        .replaceAll('yyyy', year.toString().padLeft(2, '0'))
        .replaceAll('HH', hour.toString().padLeft(2, '0'))
        .replaceAll('MM', minute.toString().padLeft(2, '0'));
  }

  String nameWithoutYear() {
    final day = this.day;
    final month = this.month;

    final daySuffixes = {
      1: 'st',
      2: 'nd',
      3: 'rd',
    };

    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final daySuffix = daySuffixes[day % 10] ?? 'th';
    final monthName = monthNames[month - 1];

    return '$day$daySuffix $monthName $hour:$minute';
  }
}
