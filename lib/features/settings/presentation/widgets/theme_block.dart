import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/models/user_settings_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/widgets/widgets.dart';

class ThemeBlock extends ConsumerWidget {
  const ThemeBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    UserSettings userSettings = ref.watch(settingsProvider);
    Themes currentType = userSettings.getThemeType;

    void onChanged(Themes type) {
      ref.read(settingsProvider.notifier).setTheme(type.index);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: theme.colorScheme.primary.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.sunny, color: theme.colorScheme.onSurface),
              SizedBox(width: 5),
              Text(
                "тема приложения",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 18,
                  fontFamily: "Soyuz",
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: theme.colorScheme.onSurface),
          RadioGroup(
            groupValue: currentType,
            onChanged: (value) => onChanged(value!),
            child: Column(
              children: [
                RadioButtonItem(
                  label: "светлая",
                  value: Themes.light,
                  onChanged: (theme) => onChanged(theme),
                ),
                RadioButtonItem(
                  label: "темная",
                  value: Themes.dark,
                  onChanged: (theme) => onChanged(theme),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
