import 'dart:io';

import 'package:desktop_dashboard/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/background_type.dart';

class BackgroundScreen extends ConsumerWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bgType =
        ref.watch(settingsProvider.select((value) => value.backgroundType));
    return selectBackground(bgType, context, ref);
  }

  Widget selectBackground(
      BackgroundType type, BuildContext context, WidgetRef ref) {
    switch (type) {
      case BackgroundType.color:
        final color = ref
            .watch(settingsProvider.select((value) => value.backgroundColor));
        return Container(
          color: color,
        );
        break;
      case BackgroundType.gradient:
        // TODO: Handle this case.
        throw UnimplementedError();
        break;
      case BackgroundType.image:
        final path =
            ref.watch(settingsProvider.select((value) => value.backgroundPath));
        if (path == null) {
          return selectBackground(BackgroundType.color, context, ref);
        }

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(File(path)), fit: BoxFit.fill)),
        );
      case BackgroundType.video:
        // TODO: Handle this case.
        throw UnimplementedError();
        break;
    }
  }
}
