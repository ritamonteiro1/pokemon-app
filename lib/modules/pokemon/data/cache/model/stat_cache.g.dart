// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatCacheAdapter extends TypeAdapter<StatCache> {
  @override
  final int typeId = 1;

  @override
  StatCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatCache(
      name: fields[0] as String,
      base: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StatCache obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.base);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
