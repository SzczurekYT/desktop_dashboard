import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:desktop_dashboard/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));

  doWhenWindowReady(() {
    final win = appWindow;
    win.alignment = Alignment.topCenter;
    win.maximize();
    win.show();
  });
}

class MyApp extends ConsumerWidget {
  final bgColor = const Color(0xFF0D1023);
  final lightColor = const Color(0x0008254b);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 25, 254, 185),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color.fromARGB(255, 252, 122, 30))),
      home: Scaffold(
        body: Stack(
          children: ref.watch(stackProvider),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                child: const Icon(Icons.settings),
                onPressed: () =>
                    ref.read(stackProvider.notifier).showSettings(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
