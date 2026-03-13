import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';

part 'preset_model.g.dart';

@HiveType(typeId: 1)
class Preset {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isPrimaryPreset;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int textSize;
  @HiveField(4)
  final List<Slice> slices;

  const Preset({
    required this.id,
    this.isPrimaryPreset = false,
    required this.name,
    required this.textSize,
    required this.slices,
  });

  Preset copyWith({
    String? name,
    int? textSize,
    List<Slice>? slices,
    bool? isPrimaryPreset,
  }) {
    return Preset(
      id: id,
      isPrimaryPreset: isPrimaryPreset ?? this.isPrimaryPreset,
      name: name ?? this.name,
      textSize: textSize ?? this.textSize,
      slices: slices ?? this.slices,
    );
  }
}
