import 'package:lucky_wheel_clean_architecture/features/history/domain/models/history_item_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';

abstract interface class IHistoryRepository {
  List<HistoryItem> fetchHistory();
  int getSpinCount(int presetId);
  Future<void> updateHistory(Preset preset, Slice slice);
  Future<void> clearHistory();
}
