import 'package:hive_ce_flutter/adapters.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';

part 'history_item_model.g.dart';

@HiveType(typeId: 3)
class HistoryItem {
  HistoryItem({
    required this.preset,
    required this.slice,
  });

  @HiveField(0)
  final Preset preset;
  @HiveField(1)
  final Slice slice;

  HistoryItem copyWith({
    Preset? preset,
    Slice? slice,
  }) {
    return HistoryItem(
      preset: preset ?? this.preset,
      slice: slice ?? this.slice,
    );
  }
}
