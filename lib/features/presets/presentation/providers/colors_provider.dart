import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'colors_provider.g.dart';

@riverpod
class ForegroundColor extends _$ForegroundColor {
  @override
  Color build() {
    return Colors.white;
  }

  void setColor(Color color) => state = color;
  void reset() => state = Colors.white;
}

@riverpod
class BackgroundColor extends _$BackgroundColor {
  @override
  Color build() {
    return Colors.red;
  }

  void setColor(Color color) => state = color;
  void reset() => state = Colors.red;
}
