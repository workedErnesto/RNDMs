import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';

abstract interface class IPresetsRepository {
  Future<void> createPreset(Preset preset);
  List<Preset> getPresets();
  List<Preset> searchPresetsByName(String name);
    Preset searchPresetById(int id);
  Future<void> updatePreset(Preset preset);
  Future<void> deletePreset(Preset preset);
}
