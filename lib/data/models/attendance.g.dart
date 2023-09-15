// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceAdapter extends TypeAdapter<Attendance> {
  @override
  final int typeId = 1;

  @override
  Attendance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attendance(
      name: fields[0] as String,
      type: fields[1] as String,
      slot: fields[2] as String,
      totalClasses: fields[3] as String,
      attendedClasses: fields[4] as String,
      attendancePercentage: fields[5] as String,
      attendanceDetail: (fields[6] as Map).cast<dynamic, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Attendance obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.slot)
      ..writeByte(3)
      ..write(obj.totalClasses)
      ..writeByte(4)
      ..write(obj.attendedClasses)
      ..writeByte(5)
      ..write(obj.attendancePercentage)
      ..writeByte(6)
      ..write(obj.attendanceDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
