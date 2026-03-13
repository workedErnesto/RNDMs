import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';

class CheckBoxIsPrimary extends ConsumerStatefulWidget {
  const CheckBoxIsPrimary({super.key, required this.tempPreset});
  final Preset tempPreset;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxIsPrimaryState();
}

class _CheckBoxIsPrimaryState extends ConsumerState<CheckBoxIsPrimary> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CheckboxListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      fillColor: WidgetStatePropertyAll(theme.colorScheme.secondary),
      dense: true,
      title: Text(
        "пресет по умолчанию:",
        style: TextStyle(
          fontSize: 22,
          color: theme.colorScheme.onSurface,
          fontFamily: 'soyuz',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      checkColor: theme.colorScheme.onSurface,
      value: widget.tempPreset.isPrimaryPreset,
      side: BorderSide(color: theme.colorScheme.secondary),
      onChanged: (value) => ref
          .read(tempPresetProvider.notifier)
          .updateTempPreset(widget.tempPreset.copyWith(isPrimaryPreset: value)),
    );
  }
}
