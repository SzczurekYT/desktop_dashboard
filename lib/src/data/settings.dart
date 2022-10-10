import 'package:desktop_dashboard/src/data/background_type.dart';
import 'package:flutter/material.dart';

@immutable
class Settings {
  final Color? _backgroundColor;
  final BackgroundType? _backgroundType;
  final String? backgroundPath;

  Color get backgroundColor => _backgroundColor ?? Colors.white;
  BackgroundType get backgroundType => _backgroundType ?? BackgroundType.color;

  const Settings(
      {Color? backgroundColor,
      BackgroundType? backgroundType,
      this.backgroundPath})
      : _backgroundColor = backgroundColor,
        _backgroundType = backgroundType;

  Settings copyWith(
      {Color? backgroundColor,
      BackgroundType? backgroundType,
      String? backgroundPath}) {
    return Settings(
        backgroundColor: backgroundColor ?? _backgroundColor,
        backgroundType: backgroundType ?? _backgroundType,
        backgroundPath: backgroundPath ?? this.backgroundPath);
  }
}
