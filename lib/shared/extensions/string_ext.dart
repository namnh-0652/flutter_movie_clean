extension StringExt on String {
  String toSubRouteLocation() {
    if (startsWith("/")) {
      return replaceFirst(RegExp('/'), '');
    } else {
      return this;
    }
  }
}
