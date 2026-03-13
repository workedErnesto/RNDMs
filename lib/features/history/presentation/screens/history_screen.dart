import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/history_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/widgets/widgets.dart';

@RoutePage()
class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(historyProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: Header(
        label: 'история',
        actionLeading: BackButton(),
        actionTrailing: DeleteHistoryButton(),
      ),
      body: historyList.isEmpty
          ? StubEmptyHistory()
          : Padding(padding: EdgeInsets.all(16), child: HistoryListView()),
    );
  }
}
