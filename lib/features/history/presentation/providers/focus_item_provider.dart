import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_item_provider.g.dart';

@riverpod
class FocusItem extends _$FocusItem {
  int? lastIndex;
  @override
  String build() => "крути!";

  void handleItemChanged(int focusIndex) {
    if (focusIndex == lastIndex) return;

    if (lastIndex == null) {
      lastIndex = focusIndex;
      Future.microtask(() => state = "крути");
      return;
    }

    final preset = ref.read(presetsListProvider.notifier).getPrimaryPreset;
    final slice = preset.slices[focusIndex];
    lastIndex = focusIndex;
    Future.microtask(() => state = slice.label);
  }

  void setFocusItem(int sliceIndex) {
    final preset = ref.read(presetsListProvider.notifier).getPrimaryPreset;
    final slice = preset.slices[sliceIndex];
    state = slice.label;
  }

  void reset() {
    lastIndex = null;
    Future.microtask(() => state = "крути");
  }
}
