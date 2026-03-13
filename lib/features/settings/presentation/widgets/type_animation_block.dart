import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/models/user_settings_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/widgets/widgets.dart';

class TypeAnimationBlock extends ConsumerWidget {
  const TypeAnimationBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    UserSettings userSettings = ref.watch(settingsProvider);
    SpinTypes currentType = userSettings.getSpinType;

    void onChanged(SpinTypes type) {
      ref.read(settingsProvider.notifier).setSpinType(type.index);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: theme.colorScheme.primary.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.tune, color: theme.colorScheme.onSurface),
              SizedBox(width: 5),
              Text(
                "тип анимации",
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
            groupValue: currentType,
            onChanged: (value) => onChanged(value!),
            child: Column(
              children: [
                RadioButtonItem(
                  label: "Колесо",
                  value: SpinTypes.wheel,
                  onChanged: (spinType) => onChanged(spinType),
                ),
                RadioButtonItem(
                  label: "Полоса",
                  value: SpinTypes.bar,
                  onChanged: (spinType) => onChanged(spinType),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
