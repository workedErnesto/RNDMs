
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/interface_repository/interface_presets_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';

class PresetsRepository implements IPresetsRepository {
  PresetsRepository({required Box<Preset> presetsBox})
    : _presetsBox = presetsBox;

  final Box<Preset> _presetsBox;

  void _ensurePrimaryPreset(List<Preset> presetsList) {
    if (!presetsList.any((preset) => preset.isPrimaryPreset) &&
        presetsList.isNotEmpty) {
      presetsList.first = presetsList.first.copyWith(isPrimaryPreset: true);
    }
  
  }

  Future<void> _syncStorage(List<Preset> presets) async {
    await _presetsBox.clear();
    final presetsMap = {for (var preset in presets) preset.id: preset};
    await _presetsBox.putAll(presetsMap);
  }

  @override
  List<Preset> getPresets() {
    final test = _presetsBox.values.toList();
    return test;
  }

  @override
  Future<void> createPreset(Preset preset) async {
    List<Preset> presetsList = getPresets();

    presetsList = preset.isPrimaryPreset
        ? presetsList.map((p) => p.copyWith(isPrimaryPreset: false)).toList()
        : presetsList;

    presetsList.add(preset);
    _ensurePrimaryPreset(presetsList);
    await _syncStorage(presetsList);
  }

  @override
  Future<void> updatePreset(Preset preset) async {
    List<Preset> presetsList = getPresets();
    presetsList = presetsList.map((p) {
      if (p.id == preset.id) {
        return preset;
      } else {
        return preset.isPrimaryPreset ? p.copyWith(isPrimaryPreset: false) : p;
      }
    }).toList();

    _ensurePrimaryPreset(presetsList);
    await _syncStorage(presetsList);
  }

  @override
  Future<void> deletePreset(Preset preset) async {
    List<Preset> presetsList = getPresets();
    presetsList = presetsList.where((p) => p.id != preset.id).toList();
    _ensurePrimaryPreset(presetsList);
    await _syncStorage(presetsList);
  }

  @override
  List<Preset> searchPresetsByName(String name) {
    List<Preset> presetsList = getPresets();
    return presetsList
        .where(
          (p) =>
              p.name.toLowerCase().trim().contains(name.toLowerCase().trim()),
        )
        .toList();
  }

  @override
  Preset searchPresetById(int id) {
    List<Preset> presetsList = getPresets();
    return presetsList.firstWhere((p) => p.id == id);
  }
}
