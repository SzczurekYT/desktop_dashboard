import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesktopScreen extends ConsumerWidget {
  DesktopScreen({Key? key}) : super(key: key);

  final offsetProvider = StateProvider<Offset>((ref) {
    return const Offset(0, 0);
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      left: ref.watch(offsetProvider).dx,
      top: ref.watch(offsetProvider).dy,
      child: GestureDetector(
        onPanUpdate: (details) =>
            ref.read(offsetProvider.notifier).state += details.delta,
        child: Image.network(
            "https://wszystkiesymbole.pl/wp-content/uploads/2021/05/logo-linux.png"),
      ),
    );
  }
}
