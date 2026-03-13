import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

enum ColorsView { base, palette }

class ModalColor extends ConsumerStatefulWidget {
  const ModalColor({super.key});

  @override
  ConsumerState<ModalColor> createState() => _ModalColorState();
}

class _ModalColorState extends ConsumerState<ModalColor> {
  ColorsView _colorSelectedView = ColorsView.base;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),

          Text(
            "выберите цвет:",
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontFamily: "Soyuz",
              fontSize: 22,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CupertinoSlidingSegmentedControl<ColorsView>(
              onValueChanged: (value) =>
                  setState(() => _colorSelectedView = value!),
              groupValue: _colorSelectedView,
              thumbColor: theme.colorScheme.secondary,
              
              children: {
                ColorsView.base: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                  child: Text(
                    "базовые",
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontFamily: "Soyuz",
                      fontSize: 17,
                    ),
                  ),
                ),
                ColorsView.palette: Text(
                  "палитра",
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontFamily: "Soyuz",
                    fontSize: 17,
                  ),
                ),
              },
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 380,
            child: switch (_colorSelectedView) {
              ColorsView.base => CircleColorsBlock(),
              ColorsView.palette => CustomColorsBlock(),
            },
          ),
        ],
      ),
    );
  }
}
