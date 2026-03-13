import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class CreateFortuneButton extends ConsumerWidget {
  const CreateFortuneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isWheel = ref.watch(settingsProvider).isWheelType;

    return ElevatedButton(
      onPressed: () => context.router.root.push(PresetEditorRoute()),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        fixedSize: Size(350, 70),
      ),
      child: Text(
        "создать ${isWheel ? "колесо" : "полоску"}",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          fontFamily: "soyuz",
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
