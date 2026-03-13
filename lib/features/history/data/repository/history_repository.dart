import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/models/history_item_model.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/repository/history_interface_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';

class HistoryRepository implements IHistoryRepository {
  final Box<HistoryItem> historyBox;

  HistoryRepository({required this.historyBox});

  Future<void> _syncStorage(HistoryItem historyItem) async =>
      await historyBox.add(historyItem);

  @override
  List<HistoryItem> fetchHistory() => historyBox.values.toList();

  @override
  Future<void> clearHistory() async => await historyBox.clear();

  @override
  Future<void> updateHistory(Preset preset, Slice slice) async =>
      await _syncStorage(HistoryItem(preset: preset, slice: slice));

  @override
  int getSpinCount(int presetId) =>
      fetchHistory().where((p) => p.preset.id == presetId).length;
}
