import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GNavBar extends ConsumerStatefulWidget {
  const GNavBar({super.key, required this.onTap, required this.activeIndex});

  final Function onTap;
  final int activeIndex;

  @override
  ConsumerState<GNavBar> createState() => _GNavBarState();
}

class _GNavBarState extends ConsumerState<GNavBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      color: theme.scaffoldBackgroundColor,
      child: GNav(
        selectedIndex: widget.activeIndex,
        backgroundColor: theme.scaffoldBackgroundColor,
        tabBorderRadius: 22,
        tabBackgroundColor: theme.colorScheme.secondary.withOpacity(0.2),
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 35,
            iconActiveColor: theme.colorScheme.secondary,
            iconColor: theme.colorScheme.secondary.withOpacity(0.3),
          ),
          GButton(
            icon: Icons.list,
            iconSize: 35,
            iconActiveColor: theme.colorScheme.secondary,
            iconColor: theme.colorScheme.secondary.withOpacity(0.3),
          ),
          GButton(
            icon: Icons.settings,
            iconSize: 35,
            iconActiveColor: theme.colorScheme.secondary,
            iconColor: theme.colorScheme.secondary.withOpacity(0.3),
          ),
        ],
        onTabChange: (index) => widget.onTap(index)
      ),
    );
  }
}
