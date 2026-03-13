import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/bar_focus_item_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/focus_item_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/dialog_status_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class FortuneItemDialog extends ConsumerWidget {
  const FortuneItemDialog({super.key, this.onTapOk, this.onTapCancel});

  final VoidCallback? onTapOk;
  final VoidCallback? onTapCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isWheel = ref.watch(settingsProvider).isWheelType;
    final selectedItem = isWheel
        ? ref.watch(focusItemProvider)
        : ref.watch(barFocusItemProvider);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Dialog(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'вам выпало:',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontFamily: "Soyuz",
                    fontSize: 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                selectedItem,
                style: TextStyle(
                  color: Colors.amber,
                  fontFamily: "Soyuz",
                  fontSize: 34,
                ),
              ),
              SizedBox(height: 16),
              CommonButton(
                onPressed: () {
                  ref.read(focusItemProvider.notifier).reset();
                  ref.read(dialogStatusProvider.notifier).toogleState();
                  context.router.maybePop();
                },
                height: 50,
                label: 'круто!',
                foregroundColor: Colors.white,
                backgroundColor: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
