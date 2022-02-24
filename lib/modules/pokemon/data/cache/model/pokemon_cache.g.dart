// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonCacheAdapter extends TypeAdapter<PokemonCache> {
  @override
  final int typeId = 0;

  @override
  PokemonCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonCache(
      abilityList: (fields[0] as List).cast<String>(),
      height: fields[1] as int,
      id: fields[2] as int,
      name: fields[3] as String,
      statList: (fields[4] as List).cast<StatCache>(),
      typeList: (fields[5] as List).cast<String>(),
      weight: fields[6] as int,
      image: fields[7] as String,
      color: fields[8] as Color,
      description: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonCache obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.abilityList)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.statList)
      ..writeByte(5)
      ..write(obj.typeList)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
