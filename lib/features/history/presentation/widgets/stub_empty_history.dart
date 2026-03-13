import 'package:flutter/material.dart';

class StubEmptyHistory extends StatelessWidget {
  const StubEmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restore,
              size: 250,
              color: theme.colorScheme.onSurface.withOpacity(0.2),
            ),
            Text(
              'история выпадений\nпуста',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 30,
                fontFamily: "Soyuz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
