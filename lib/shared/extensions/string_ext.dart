extension StringExt on String {
  String toSubRouteLocation() {
    if (startsWith("/")) {
      return replaceFirst(RegExp('/'), '');
    } else {
      return this;
    }
  }

  // Validation
  bool get isValidEmail {
    final emailRegex = RegExp(
        "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    return emailRegex.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegex = RegExp(
        "^(?=.*[-_!.?+\$%#&*=@])(?=.*[A-Za-z0-9])[-_!.?+\$%#&*=@A-Za-z0-9]{8,16}\$");
    return passwordRegex.hasMatch(this);
  }
}
