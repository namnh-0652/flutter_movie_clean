import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';

enum CategoryType {
  movies,
  series;
}

extension CategoryTypeExtension on CategoryType {
  String getLabel(BuildContext context) {
    if (this == CategoryType.movies) {
      return context.l10n.movies;
    } else {
      return context.l10n.series;
    }
  }
}
