import 'package:desktop_dashboard/src/data/background_type.dart';
import 'package:desktop_dashboard/src/data/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier() : super(Settings());

  void setBackgroundType(BackgroundType type) {
    state = state.copyWith(backgroundType: type);
  }

  void setColor(Color color) {
    state = state.copyWith(backgroundColor: color);
  }

  void setBackgroundPath(String path) {
    state = state.copyWith(backgroundPath: path);
  }
}
