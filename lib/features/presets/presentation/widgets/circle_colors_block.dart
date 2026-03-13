import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CircleColorsBlock extends ConsumerWidget {
  final List<Color>? savedColor;
  const CircleColorsBlock({super.key, this.savedColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> baseColors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.orange,

      Color(0xFFE57373), // red soft
      Color(0xFFF06292), // pink soft
      Color(0xFFBA68C8), // purple soft
      Color(0xFF9575CD), // deep purple soft
      Color(0xFF7986CB), // indigo soft
      Color(0xFF64B5F6), // blue soft
      Color(0xFF4DD0E1), // cyan soft
      Color(0xFF4DB6AC), // teal soft
      Color(0xFF81C784), // green soft
      Color(0xFFFFB74D), // orange soft
    ];

    return BlockPicker(
      useInShowDialog: false,
      availableColors: baseColors,
      pickerColor: null,
      onColorChanged: (value) {
        context.router.maybePop(value);
      },
    );
  }
}
