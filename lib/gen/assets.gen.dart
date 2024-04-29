/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/animation_community.json
  LottieGenImage get animationCommunity =>
      const LottieGenImage('assets/animations/animation_community.json');

  /// File path: assets/animations/animation_email_sent.json
  LottieGenImage get animationEmailSent =>
      const LottieGenImage('assets/animations/animation_email_sent.json');

  /// File path: assets/animations/animation_empty.json
  LottieGenImage get animationEmpty =>
      const LottieGenImage('assets/animations/animation_empty.json');

  /// File path: assets/animations/animation_error.json
  LottieGenImage get animationError =>
      const LottieGenImage('assets/animations/animation_error.json');

  /// File path: assets/animations/animation_games.json
  LottieGenImage get animationGames =>
      const LottieGenImage('assets/animations/animation_games.json');

  /// File path: assets/animations/animation_map_loading.json
  LottieGenImage get animationMapLoading =>
      const LottieGenImage('assets/animations/animation_map_loading.json');

  /// File path: assets/animations/animation_maps.json
  LottieGenImage get animationMaps =>
      const LottieGenImage('assets/animations/animation_maps.json');

  /// File path: assets/animations/animation_searching_files.json
  LottieGenImage get animationSearchingFiles =>
      const LottieGenImage('assets/animations/animation_searching_files.json');

  /// File path: assets/animations/animation_success.json
  LottieGenImage get animationSuccess =>
      const LottieGenImage('assets/animations/animation_success.json');

  /// List of all assets
  List<LottieGenImage> get values => [
        animationCommunity,
        animationEmailSent,
        animationEmpty,
        animationError,
        animationGames,
        animationMapLoading,
        animationMaps,
        animationSearchingFiles,
        animationSuccess
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/hintergrundBremen.jpg
  AssetGenImage get hintergrundBremen =>
      const AssetGenImage('assets/images/hintergrundBremen.jpg');

  /// File path: assets/images/hintergrundBremen1.jpg
  AssetGenImage get hintergrundBremen1 =>
      const AssetGenImage('assets/images/hintergrundBremen1.jpg');

  /// File path: assets/images/hintergrundBremen2.jpg
  AssetGenImage get hintergrundBremen2 =>
      const AssetGenImage('assets/images/hintergrundBremen2.jpg');

  /// File path: assets/images/strassen.json
  String get strassen => 'assets/images/strassen.json';

  /// List of all assets
  List<dynamic> get values =>
      [hintergrundBremen, hintergrundBremen1, hintergrundBremen2, strassen];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
