import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';

class SliderTextSize extends ConsumerStatefulWidget {
  final Preset preset;
  const SliderTextSize(this.preset, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SliderTextSizeState();
}

class _SliderTextSizeState extends ConsumerState<SliderTextSize> {
  late double textSizeValue;

  @override
  void initState() {
    super.initState();
    textSizeValue = widget.preset.textSize.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "размер текста",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontFamily: "Soyuz",
                  fontSize: 20,
                ),
              ),
              Text(
                textSizeValue.toInt().toString(),
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontFamily: "Soyuz",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        CupertinoSlider(
          max: 36,
          min: 10,
          activeColor: theme.colorScheme.secondary,
          value: textSizeValue,
          onChanged: (value) {
            ref
                .read(tempPresetProvider.notifier)
                .updateTempPreset(
                  widget.preset.copyWith(textSize: value.round()),
                );
            setState(() {
              textSizeValue = value.roundToDouble();
            });
          },
        ),
      ],
    );
  }
}
