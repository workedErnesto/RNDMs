import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class FortuneImg extends ConsumerWidget {
  const FortuneImg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isWheel = ref.watch(settingsProvider).isWheelType;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SvgPicture.asset(
        "assets/icons/${isWheel ? "inactive_wheel" : "inactive_bar"}.svg",
        height: isWheel ? 350 : 150,
        color: theme.colorScheme.secondary.withOpacity(0.2),
      ),
    );
  }
}
