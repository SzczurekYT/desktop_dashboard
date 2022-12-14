import 'package:desktop_dashboard/src/screen/background_screen.dart';
import 'package:desktop_dashboard/src/screen/desktop_screen.dart';
import 'package:desktop_dashboard/src/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetStackNotifier extends StateNotifier<List<Widget>> {
  WidgetStackNotifier() : super([const BackgroundScreen(), DesktopScreen()]);

  void home() {
    state = [const BackgroundScreen(), DesktopScreen()];
  }

  void showSettings() {
    state = [const BackgroundScreen(), DesktopScreen(), const SettingsScreen()];
  }
}
