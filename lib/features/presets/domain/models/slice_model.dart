import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'slice_model.g.dart';
@HiveType(typeId: 2)
class Slice {
    @HiveField(0)
  final int id;
    @HiveField(1)
  final String label;
    @HiveField(2)
  final Color backgroundColor;
    @HiveField(3)
  final Color foregroundColor;

  Slice({
    required this.id,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  Slice copyWith({
    int? id,
    String? label,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return Slice(
      id: id ?? this.id,
      label: label ?? this.label,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }
}
