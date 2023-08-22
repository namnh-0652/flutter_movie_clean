import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';
import 'package:flutter_movie_clean/shared/extensions/string_ext.dart';

final class ValidateHelper {
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.emptyEmail;
    }
    if (value.isValidEmail == false) {
      return context.l10n.wrongEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.emptyPassword;
    }
    if (value.isValidPassword == false) {
      return context.l10n.wrongPassword;
    }
    return null;
  }
}
