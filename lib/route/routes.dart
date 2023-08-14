class Routes {
  static const String main = "/";
  static const String home = "/home";
  static const String categories = "/categories";
}

extension StringExt on String {

  String toChildRouteLocation() {
    if (startsWith("/")) {
      return replaceFirst(RegExp('/'), '');
    } else {
      return this;
    }
  }
}
