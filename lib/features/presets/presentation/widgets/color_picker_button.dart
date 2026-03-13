import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

class ColorPickerButton extends ConsumerStatefulWidget {
  final String label;
  final Color defaultColor;
  final void Function(Color color) changeColor;
  const ColorPickerButton({
    super.key,
    required this.label,
    required this.defaultColor,
    required this.changeColor,
  });

  @override
  ConsumerState<ColorPickerButton> createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends ConsumerState<ColorPickerButton> {
  late Color selectColor = widget.defaultColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () async {
        final request = await showModalBottomSheet(
          context: context,
          backgroundColor: theme.scaffoldBackgroundColor,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (context) => const ModalColor(),
        );
        selectColor = request ?? widget.defaultColor;
        widget.changeColor(selectColor);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        backgroundColor: theme.colorScheme.primary.withOpacity(0.13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontFamily: "Soyuz",
              fontSize: 22,
            ),
          ),
          Container(width: 35, height: 35, color: selectColor),
        ],
      ),
    );
  }
}
