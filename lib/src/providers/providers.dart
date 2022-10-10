import 'package:desktop_dashboard/src/data/settings.dart';
import 'package:desktop_dashboard/src/providers/settings_provider.dart';
import 'package:desktop_dashboard/src/providers/widget_stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stackProvider =
    StateNotifierProvider<WidgetStackNotifier, List<Widget>>((ref) {
  return WidgetStackNotifier();
});

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier();
});
