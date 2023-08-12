// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periods.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeriodsAdapter extends TypeAdapter<Periods> {
  @override
  final int typeId = 2;

  @override
  Periods read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Periods(
      (fields[0] as List).cast<Period>(),
    );
  }

  @override
  void write(BinaryWriter writer, Periods obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.periods);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
