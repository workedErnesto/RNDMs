import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class RadioButtonItem<T extends Enum> extends ConsumerWidget {
  const RadioButtonItem({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Radio<T>(
          value: value,
          activeColor: theme.colorScheme.secondary,
          side: BorderSide(color: theme.colorScheme.onSurface, width: 2),
        ),
        GestureDetector(
          onTap: () => onChanged(value),
          child: Text(
            label,
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 18,
              fontFamily: "Soyuz",
            ),
          ),
        ),
      ],
    );
  }
}
