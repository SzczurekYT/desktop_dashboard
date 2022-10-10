import 'package:desktop_dashboard/src/data/background_type.dart';
import 'package:desktop_dashboard/src/providers/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(settingsProvider).backgroundType;
    final selectorProvider = Provider<List<Widget>>((ref) {
      switch (type) {
        case BackgroundType.color:
          final Color color = ref.watch(
              settingsProvider.select((settings) => settings.backgroundColor));
          return [
            const Text("Background color: "),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                  onPressed: (() {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                  pickerColor: color,
                                  onColorChanged: (Color color) {
                                    ref
                                        .read(settingsProvider.notifier)
                                        .setColor(color);
                                  }),
                            ),
                          );
                        });
                  }),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color),
                  ),
                  child: null),
            ),
          ];
        case BackgroundType.gradient:
          // TODO: Handle this case.
          return [];
        case BackgroundType.image:
          final backgroundPath = ref.watch(
              settingsProvider.select((settings) => settings.backgroundPath));
          return [
            const Text("Background image: "),
            ElevatedButton(
              onPressed: (() async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles(allowMultiple: false, type: FileType.image);
                if (result == null) return;
                if (result.files.single.path == null) return;
                ref
                    .read(settingsProvider.notifier)
                    .setBackgroundPath(result.files.single.path!);
              }),
              child: const Text("Select image"),
            )
          ];
        case BackgroundType.video:
          // TODO: Handle this case.
          return [];
      }
    });
    final List<Widget> selector = ref.watch(selectorProvider);

    return Opacity(
      opacity: 1,
      child: Center(
        child: SizedBox(
          width: 800,
          child: Container(
            // width: 800,
            height: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)]),
            child: ListView(
              children: [
                IconButton(
                  onPressed: () => ref.read(stackProvider.notifier).home(),
                  icon: const Icon(Icons.arrow_back),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Background type: "),
                    DropdownButton<BackgroundType>(
                      iconSize: 36,
                      underline: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        height: 2,
                      ),
                      isExpanded: false,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      value: type,
                      items: BackgroundType.values
                          .map<DropdownMenuItem<BackgroundType>>(
                              (e) => DropdownMenuItem<BackgroundType>(
                                    value: e,
                                    child: Text(e.toString()),
                                  ))
                          .toList(),
                      onChanged: (BackgroundType? type) {
                        ref
                            .read(settingsProvider.notifier)
                            .setBackgroundType(type ?? BackgroundType.color);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: selector,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
