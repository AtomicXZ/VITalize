import 'package:hive_flutter/hive_flutter.dart';

part 'attendance.g.dart';

@HiveType(typeId: 1)
class Attendance extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String slot;
  @HiveField(3)
  final String totalClasses;
  @HiveField(4)
  final String attendedClasses;
  @HiveField(5)
  final String attendancePercentage;
  @HiveField(6)
  final Map attendanceDetail;

  Attendance(
      {required this.name,
      required this.type,
      required this.slot,
      required this.totalClasses,
      required this.attendedClasses,
      required this.attendancePercentage,
      required this.attendanceDetail});

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
        name: map['name'],
        type: map['courseType'],
        slot: map['slot'],
        totalClasses: map['totalClasses'],
        attendedClasses: map['attendedClasses'],
        attendancePercentage: map['attendancePercentage'],
        attendanceDetail: map['attendanceDetail']);
  }
}
