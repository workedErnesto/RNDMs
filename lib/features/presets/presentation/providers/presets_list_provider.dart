import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/focus_item_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/interface_repository/interface_presets_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presets_list_provider.g.dart';

@riverpod
class PresetsList extends _$PresetsList {
  final _repository = GetIt.I<IPresetsRepository>();
  @override
  List<Preset> build() => _repository.getPresets();

  int getMaxPresetID() => state.map((p) => p.id).fold(0, max) + 1;

  Preset get getPrimaryPreset => state.firstWhere((p) => p.isPrimaryPreset);

  void searchPresetsByName(String name) =>
      state = _repository.searchPresetsByName(name);

  bool isEmptyPresets() => _repository.getPresets().isEmpty;

  Future<void> addPreset(Preset preset) async {
    await _repository.createPreset(preset);
    state = _repository.getPresets();
    ref.read(focusItemProvider.notifier).reset();
  }

  Future<void> updatePreset(Preset preset) async {
    await _repository.updatePreset(preset);
    state = _repository.getPresets();
    ref.read(focusItemProvider.notifier).reset();
  }

  Future<void> removePreset(Preset preset) async {
    await _repository.deletePreset(preset);
    state = _repository.getPresets();
    ref.read(focusItemProvider.notifier).reset();
  }
}
