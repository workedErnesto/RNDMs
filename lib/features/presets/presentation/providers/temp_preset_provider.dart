import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_preset_provider.g.dart';



@Riverpod(keepAlive: true)
class TempPreset extends _$TempPreset {
  @override
  Preset build() {
    return _defaultPreset();
  }

  int getMaxSliceID() => state.slices.map((s) => s.id).fold(0, max) + 1;

  void updateTempPreset(Preset preset) => state = preset;

  void reset() => state = _defaultPreset();

  void addSlice(Slice slice) {
    state = state.copyWith(slices: [...state.slices, slice]);
  }

  void deleteSlice(Slice slice) {
    state = state.copyWith(
      slices: state.slices.where((s) => s.id != slice.id).toList(),
    );
  }

  void updateSlice(Slice slice) {
    state = state.copyWith(
      slices: state.slices.map((s) {
        if (s.id == slice.id) {
          return slice;
        } else {
          return s;
        }
      }).toList(),
    );
  }
}

Preset _defaultPreset() => Preset(
  id: -1,
  name: '',
  textSize: 16,
  slices: [
    Slice(
      id: 0,
      label: 'Правда',
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    Slice(
      id: 1,
      label: 'Ложь',
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
  ],
);
