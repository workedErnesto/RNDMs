import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(left: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        alignment: Alignment.centerLeft,
        backgroundColor: theme.colorScheme.primary.withOpacity(0.05),
        minimumSize: Size.fromHeight(50),
      ),
      onPressed: () => context.router.push(AboutAppRoute()),
      label: Text(
        "о приложении",
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 18,
          fontFamily: "Soyuz",
        ),
      ),
      icon: Icon(Icons.info, color: theme.colorScheme.onSurface),
    );
  }
}
