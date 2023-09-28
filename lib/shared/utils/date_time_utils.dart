import 'package:intl/intl.dart';

final class DateTimeUtils {
  static String? formatReleaseDate(String? releaseDate) {
    if (releaseDate == null || releaseDate.isEmpty == true) return null;
    return DateFormat(formatYYYY).format(DateTime.parse(releaseDate));
  }

  static const String formatYYYY = "yyyy";
}
