// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PresetAdapter extends TypeAdapter<Preset> {
  @override
  final typeId = 1;

  @override
  Preset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preset(
      id: (fields[0] as num).toInt(),
      isPrimaryPreset: fields[1] == null ? false : fields[1] as bool,
      name: fields[2] as String,
      textSize: (fields[3] as num).toInt(),
      slices: (fields[4] as List).cast<Slice>(),
    );
  }

  @override
  void write(BinaryWriter writer, Preset obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isPrimaryPreset)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.textSize)
      ..writeByte(4)
      ..write(obj.slices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
