import 'package:get_it/get_it.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/models/history_item_model.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/repository/history_interface_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_provider.g.dart';

@riverpod
class History extends _$History {
  final _repository = GetIt.I<IHistoryRepository>();

  @override
  List<HistoryItem> build() {
    return _repository.fetchHistory();
  }

  Future<void> addToHistory(Preset preset, int index) async {
    final slice = preset.slices[index];
    await _repository.updateHistory(preset, slice);
    state = _repository.fetchHistory();
  }

  Future<void> clearHistory() async {
    await _repository.clearHistory();
    state = _repository.fetchHistory();
  }

  int getSpinCount(int presetId) => _repository.getSpinCount(presetId);
}
