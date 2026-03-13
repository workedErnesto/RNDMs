import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bar_focus_item_provider.g.dart';

@Riverpod(keepAlive: true)
class BarFocusItem extends _$BarFocusItem {
  @override
  String build() => "";

  void handleItemChanged(int focusIndex) {
    final preset = ref.read(presetsListProvider.notifier).getPrimaryPreset;
    final slice = preset.slices[focusIndex];
    state = slice.label;
  }
}
