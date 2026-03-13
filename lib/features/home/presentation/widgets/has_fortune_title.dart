import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';


class HasFortuneTitle extends ConsumerWidget {
  const HasFortuneTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWheel = ref.watch(settingsProvider).isWheelType;
    final theme = Theme.of(context);
    return Text(
      "${isWheel ? "колеса" : "полоски"} пока нет",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        fontFamily: "soyuz",
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}

