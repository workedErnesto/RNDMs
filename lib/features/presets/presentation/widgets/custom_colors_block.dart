import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';

class CustomColorsBlock extends StatefulWidget {
  const CustomColorsBlock({super.key});

  @override
  State<CustomColorsBlock> createState() => _CustomColorsBlockState();
}

class _CustomColorsBlockState extends State<CustomColorsBlock> {
  Color selectedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (value) {
              setState(() => selectedColor = value);
            },
            colorHistory: [],
            enableAlpha: false,
            labelTypes: [],
            paletteType: PaletteType.hsvWithHue,
            pickerAreaHeightPercent: 0.7,
          ),
          CommonButton(
            label: 'сохранить',
            onPressed: () => context.router.maybePop(selectedColor),
            foregroundColor: Colors.white,
            backgroundColor: theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
