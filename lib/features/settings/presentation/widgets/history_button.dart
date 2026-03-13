import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        backgroundColor: theme.colorScheme.primary.withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.only(left: 15),
        alignment: Alignment.centerLeft,
      ),
      onPressed: () => context.router.push(HistoryRoute()),
      label: Text(
        "история выпадений",
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 18,
          fontFamily: "Soyuz",
        ),
      ),
      icon: Icon(Icons.history, color: theme.colorScheme.onSurface),
    );
  }
}
