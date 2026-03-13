import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/dialog_status_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class ReadyHome extends ConsumerStatefulWidget {
  const ReadyHome({super.key});

  @override
  ConsumerState<ReadyHome> createState() => _ReadyHomeState();
}

class _ReadyHomeState extends ConsumerState<ReadyHome> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryPreset = ref
        .watch(presetsListProvider.notifier)
        .getPrimaryPreset;
    final isWheel = ref.watch(settingsProvider).isWheelType;

    ref.listen(dialogStatusProvider, (previous, next) {
      if (next == Status.show) {
        showDialog(
          context: context,
          builder: (BuildContext context) => const FortuneItemDialog(),
        );
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              primaryPreset.name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 42,
                fontFamily: "soyuz",
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            isWheel ? FocusItemText() : SizedBox(),
            SizedBox(height: 10),
            !isWheel
                ? PresetFortuneBar(
                    tempPreset: primaryPreset,
                    hasIndicitor: true,
                  )
                : PresetFortuneWheel(
                    tempPreset: primaryPreset,
                    hasIndicitor: true,
                  ),
            SizedBox(height: 20),
            SpinButton(primaryPreset: primaryPreset),
          ],
        ),
      ),
    );
  }
}
