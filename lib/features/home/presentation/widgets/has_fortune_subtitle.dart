import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class HasFortuneSubTitle extends ConsumerWidget {
  const HasFortuneSubTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWheel = ref.watch(settingsProvider).isWheelType;
    final theme = Theme.of(context);
    return Text(
      "Но вы всегда можете создать ${isWheel ? "колесо" : "полоску"},\nнажав на кнопку",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        fontFamily: "soyuz",
        color: theme.colorScheme.onSurface.withOpacity(0.5),
      ),
      textAlign: TextAlign.center,
    );
  }
}
