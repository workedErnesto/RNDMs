import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/models/history_item_model.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({super.key, required this.historyItem});

  final HistoryItem historyItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: theme.colorScheme.secondary.withOpacity(0.05),
      textColor: theme.colorScheme.onSurface,
      leading: StaticLuckyWheel(slices: historyItem.preset.slices),
      title: Text(
        historyItem.preset.name,
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 22,
          fontFamily: "Soyuz",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        "что выпало: ${historyItem.slice.label}",
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 18,
          fontFamily: "Soyuz",
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
