import 'package:flutter/material.dart';

class PSBlock extends StatelessWidget {
  const PSBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          "P.S. Разработано в поисках идеального баланса между хаосом и порядком",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 16,
            fontFamily: "Soyuz",

            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "version: 1.0.0",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 14,
            fontFamily: "Soyuz",

            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
