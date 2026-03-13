import 'package:flutter/material.dart';
// import 'package:lucky_wheel_01/design/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget? actionTrailing;
  final Widget? actionLeading;
  final String label;
  const Header({
    super.key,
    required this.label,
    this.actionTrailing,
    this.actionLeading,
  });

  @override
  Widget build(BuildContext context) {
            final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontFamily: "Soyuz",
            fontSize: 30,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [if (actionTrailing != null) actionTrailing!],
        actionsPadding: actionTrailing == null
            ? EdgeInsets.zero
            : EdgeInsets.only(right: 15),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: actionLeading ?? actionLeading,
        ),
        leadingWidth: 72,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
