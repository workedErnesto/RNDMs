import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/history_provider.dart';

class DeleteHistoryButton extends ConsumerWidget {
  const DeleteHistoryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton.filled(
      onPressed: ref.watch(historyProvider).isEmpty == false
          ? () async {
              final isOk = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return WarningError(
                    warningLabel:
                        'вы точно уверены, что хотите удалить всю историю?\n\nэто действие нельзя отменить.',
                  );
                },
              );
              if (isOk == true)
                ref.watch(historyProvider.notifier).clearHistory();
            }
          : null,
      icon: Icon(Icons.delete_forever_rounded, color: Colors.white, size: 30),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: Size(56, 56),
        backgroundColor: Colors.red,
      ),
    );
  }
}
