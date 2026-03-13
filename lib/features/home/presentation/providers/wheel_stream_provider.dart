import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/bar_focus_item_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/history_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/dialog_status_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/providers/spin_button_state_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wheel_stream_provider.g.dart';

@riverpod
class WheelStream extends _$WheelStream {
  @override
  StreamController<int> build() {
    final controller = StreamController<int>.broadcast();
    ref.onDispose(() => controller.close());
    return controller;
  }

  void spin(Preset preset) {
    final number = Fortune.randomInt(0, preset.slices.length);
    final isWheel = ref.read(settingsProvider).isWheelType;
    state.add(number);

    if (isWheel == false) {
      ref.read(barFocusItemProvider.notifier).handleItemChanged(number);
    }

    ref.read(historyProvider.notifier).addToHistory(preset, number);
    ref.read(isSpinningProvider.notifier).toogleState();

    final duration = ref.read(settingsProvider).getSpeedQuantity + 2;
    Future.delayed(Duration(seconds: duration), () {
      ref.read(isSpinningProvider.notifier).toogleState();
      ref.read(dialogStatusProvider.notifier).toogleState();
    });
  }
}
