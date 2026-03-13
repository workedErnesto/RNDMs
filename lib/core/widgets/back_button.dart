
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonBackButton extends ConsumerWidget {
  const CommonBackButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return IconButton.filled(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back, color: theme.colorScheme.secondary),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: Size(25, 10),
        backgroundColor: theme.colorScheme.inverseSurface,
      ),
    );
  }
}
