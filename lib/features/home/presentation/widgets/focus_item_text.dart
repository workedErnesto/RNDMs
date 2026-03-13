import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/focus_item_provider.dart';


class FocusItemText extends ConsumerWidget {
  const FocusItemText({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final focusItem = ref.watch(focusItemProvider);

        final theme = Theme.of(context);
    return Text(
      focusItem,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        fontFamily: "soyuz",
        color: theme.colorScheme.onSurface,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
