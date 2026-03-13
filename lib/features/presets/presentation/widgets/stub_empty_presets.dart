import 'package:flutter/material.dart';

class StubEmptyPresets extends StatelessWidget {
  const StubEmptyPresets({super.key, required this.isSearchStub});

  final bool isSearchStub;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isSearchStub ? Icons.search_off : Icons.playlist_add,
          color: theme.colorScheme.onSurface.withOpacity(0.3),
          size: 150,
        ),
        Text(
          isSearchStub ? "ничего не нашлось :(" : "пресетов пока нет :(",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 28,
            fontFamily: "Soyuz",
          ),
        ),
      ],
    );
  }
}
