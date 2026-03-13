import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/wheel_stream_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class PresetFortuneBar extends ConsumerWidget {
  const PresetFortuneBar({
    super.key,
    required this.tempPreset,
    this.height,
    this.width,
    required this.hasIndicitor,
    this.fontSize,
    this.padding,
  });

  final Preset tempPreset;
  final double? height;
  final double? width;
  final bool hasIndicitor;
  final double? fontSize;
  final double? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StreamController<int> controller = ref.watch(wheelStreamProvider);
    final duration = ref.watch(settingsProvider).getSpeedQuantity;
    return SizedBox(
      width: width ?? double.infinity,
      child: FortuneBar(
        height: 125,
        styleStrategy: CustomPresetStyleStrategy(
          tempPreset.slices.map((slice) {
            return FortuneItemStyle(color: slice.backgroundColor);
          }).toList(),
        ),
        physics: NoPanPhysics(),
        animateFirst: false,
        duration: Duration(seconds: duration),
        indicators: hasIndicitor
            ? [
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: RectangleIndicator(borderColor: Colors.amber),
                ),
              ]
            : [],
        items: [
          for (var item in tempPreset.slices)
            FortuneItem(
              child: Text(
                overflow: TextOverflow.ellipsis,
                item.label,
                style: TextStyle(
                  fontSize: fontSize ?? tempPreset.textSize.toDouble(),
                  color: item.foregroundColor,
                  fontFamily: 'soyuz',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
        selected: controller.stream,
      ),
    );
  }
}

class CustomPresetStyleStrategy extends StyleStrategy {
  final List<FortuneItemStyle> styles;

  CustomPresetStyleStrategy(this.styles);

  @override
  FortuneItemStyle getItemStyle(ThemeData theme, int index, int itemCount) {
    return styles[index % styles.length];
  }
}
