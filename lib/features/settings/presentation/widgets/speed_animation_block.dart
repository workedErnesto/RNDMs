import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/models/user_settings_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/widgets/widgets.dart';

class SpeedAnimationBlock extends ConsumerWidget {
  const SpeedAnimationBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    UserSettings userSettings = ref.watch(settingsProvider);
    Speed currentSpeed = userSettings.getSpeedType;

    void onChanged(int type) =>
        ref.read(settingsProvider.notifier).setSpeed(type);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: const Color.fromARGB(255, 26, 40, 57),
        color: theme.colorScheme.primary.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(Icons.speed, color: theme.colorScheme.onSurface),
              SizedBox(width: 5),
              Text(
                "cкорость анимации прокрутки",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 18,
                  fontFamily: "Soyuz",
                ),
              ),
            ],
          ),
          Divider(color: theme.colorScheme.onSurface, thickness: 2),
          RadioGroup(
            groupValue: currentSpeed,
            onChanged: (value) => onChanged(value!.index),
            child: Column(
              children: [
                RadioButtonItem(
                  label: "медленно",
                  value: Speed.slow,
                  onChanged: (speed) => onChanged(speed.index),
                ),
                RadioButtonItem(
                  label: "обычно",
                  value: Speed.normal,
                  onChanged: (speed) => onChanged(speed.index),
                ),
                RadioButtonItem(
                  label: "быстро",
                  value: Speed.fast,
                  onChanged: (speed) => onChanged(speed.index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
