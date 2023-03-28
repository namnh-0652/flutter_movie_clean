import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/colors.gen.dart';
import '../../generated/locale_keys.g.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(width: 3.0, color: ColorName.crimsonApprox),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      onPressed: () {
        context.go(context.namedLocation('downloads'));
      },
      child: Text(
        LocaleKeys.downloads.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
