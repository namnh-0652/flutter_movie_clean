/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Marvel-Logo.png
  AssetGenImage get marvelLogo => const AssetGenImage('assets/images/Marvel-Logo.png');

  $AssetsImagesAvatarGen get avatar => const $AssetsImagesAvatarGen();

  /// List of all assets
  List<AssetGenImage> get values => [marvelLogo];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class $AssetsImagesAvatarGen {
  const $AssetsImagesAvatarGen();

  /// File path: assets/images/avatar/avatar_1.png
  AssetGenImage get avatar1 => const AssetGenImage('assets/images/avatar/avatar_1.png');

  /// File path: assets/images/avatar/avatar_2.png
  AssetGenImage get avatar2 => const AssetGenImage('assets/images/avatar/avatar_2.png');

  /// File path: assets/images/avatar/avatar_3.png
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar/avatar_3.png');

  /// File path: assets/images/avatar/avatar_4.png
  AssetGenImage get avatar4 => const AssetGenImage('assets/images/avatar/avatar_4.png');

  /// File path: assets/images/avatar/avatar_5.png
  AssetGenImage get avatar5 => const AssetGenImage('assets/images/avatar/avatar_5.png');

  /// File path: assets/images/avatar/avatar_6.png
  AssetGenImage get avatar6 => const AssetGenImage('assets/images/avatar/avatar_6.png');

  /// File path: assets/images/avatar/avatar_7.png
  AssetGenImage get avatar7 => const AssetGenImage('assets/images/avatar/avatar_7.png');

  /// File path: assets/images/avatar/avatar_8.png
  AssetGenImage get avatar8 => const AssetGenImage('assets/images/avatar/avatar_8.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatar1, avatar2, avatar3, avatar4, avatar5, avatar6, avatar7, avatar8];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
