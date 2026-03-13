import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/focus_item_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/wheel_stream_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class PresetFortuneWheel extends ConsumerWidget {
  const PresetFortuneWheel({
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
    final controller = ref.watch(wheelStreamProvider);
    final duration = ref.read(settingsProvider).getSpeedQuantity;
    return SizedBox(
      height: height ?? 350,
      width: width ?? double.infinity,
      child: FortuneWheel(
        onFocusItemChanged: (index) {
          ref.read(focusItemProvider.notifier).handleItemChanged(index);
        },
        duration: Duration(seconds: duration),
        selected: controller.stream,
        physics: NoPanPhysics(),
        animateFirst: false,
        indicators: hasIndicitor
            ? [
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(color: Colors.amber),
                ),
              ]
            : [],
        items: [
          for (var item in tempPreset.slices)
            FortuneItem(
              style: FortuneItemStyle(
                color: item.backgroundColor,
                borderWidth: 1,
              ),
              child: Padding(
                padding: EdgeInsets.all(padding ?? 18.0),
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: fontSize ?? tempPreset.textSize.toDouble(),
                    color: item.foregroundColor,
                    fontFamily: 'soyuz',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
