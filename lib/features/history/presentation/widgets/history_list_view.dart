import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/history_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/widgets/widgets.dart';

class HistoryListView extends ConsumerWidget {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(historyProvider);
    final theme = Theme.of(context);
    return ListView.separated(
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          color: theme.scaffoldBackgroundColor,
          child: HistoryListItem(historyItem: historyList[index]),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: historyList.length,
    );
  }
}
