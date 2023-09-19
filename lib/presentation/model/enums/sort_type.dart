import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/shared/extensions/context_ext.dart';

enum SortType {
  newest("primary_release_date.desc"),
  oldest("primary_release_date.asc"),
  top("vote_average.desc"),
  order("vote_average.asc");

  const SortType(this.value);

  final String value;
}

extension SortTypeExtension on SortType {
  String getLabel(BuildContext context) {
    switch (this) {
      case SortType.newest:
        return context.l10n.newest;
      case SortType.oldest:
        return context.l10n.oldest;
      case SortType.top:
        return context.l10n.top;
      default:
        return context.l10n.order;
    }
  }
}
