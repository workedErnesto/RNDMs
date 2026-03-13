import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/spin_button_state_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/wheel_stream_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';

class SpinButton extends ConsumerWidget {
  const SpinButton({super.key, required this.primaryPreset});

  final Preset primaryPreset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isSpinning = ref.watch(isSpinningProvider);
    return ElevatedButton(
      onPressed: isSpinning
          ? null
          : () => ref.read(wheelStreamProvider.notifier).spin(primaryPreset),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        fixedSize: Size(350, 70),
      ),
      child: const Text(
        "крутить",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          fontFamily: "soyuz",
          color: Colors.white,
        ),
      ),
    );
  }
}
