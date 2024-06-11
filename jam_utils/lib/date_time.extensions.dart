import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

// _pluralize(int count, String singular, [String? plural]) {
//   plural ??= '${singular}s';
//   return count == 1 ? singular : plural;
// }

extension DateTimeConverter on DateTime {
  get toNTimeAgo => timeago.format(this, locale: 'en_short');

  String get atTime => DateFormat('HH:mm').format(this);

  bool isOtherDay(DateTime other) =>
      year != other.year || month != other.month || day != other.day;

  String format(String format) => DateFormat(format).format(this);

  get nameWithoutYear => DateFormat('d MMM H:mm').format(this);
}
