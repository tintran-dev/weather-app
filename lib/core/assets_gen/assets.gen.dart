/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage cloudy = AssetGenImage('assets/cloudy.png');
  static const AssetGenImage cloudySunny =
      AssetGenImage('assets/cloudy_sunny.png');
  static const AssetGenImage highTemperature =
      AssetGenImage('assets/high_temperature.png');
  static const AssetGenImage humidity = AssetGenImage('assets/humidity.png');
  static const AssetGenImage lowTemperature =
      AssetGenImage('assets/low_temperature.png');
  static const AssetGenImage rain = AssetGenImage('assets/rain.png');
  static const AssetGenImage rainy = AssetGenImage('assets/rainy.png');
  static const AssetGenImage snowy = AssetGenImage('assets/snowy.png');
  static const AssetGenImage storm = AssetGenImage('assets/storm.png');
  static const AssetGenImage sun = AssetGenImage('assets/sun.png');
  static const AssetGenImage sunny = AssetGenImage('assets/sunny.png');
  static const AssetGenImage sunrise = AssetGenImage('assets/sunrise.png');
  static const AssetGenImage sunset = AssetGenImage('assets/sunset.png');
  static const AssetGenImage wind = AssetGenImage('assets/wind.png');
  static const AssetGenImage windy = AssetGenImage('assets/windy.png');
  static const AssetGenImage windyCloudy =
      AssetGenImage('assets/windy_cloudy.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cloudy,
        cloudySunny,
        highTemperature,
        humidity,
        lowTemperature,
        rain,
        rainy,
        snowy,
        storm,
        sun,
        sunny,
        sunrise,
        sunset,
        wind,
        windy,
        windyCloudy
      ];
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
