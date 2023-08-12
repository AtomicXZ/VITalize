import 'package:hive_flutter/hive_flutter.dart';

part 'period.g.dart';

@HiveType(typeId: 0)
class Period extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String slot;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final String startTime;
  @HiveField(5)
  final String endTime;

  Period({
    required this.name,
    required this.code,
    required this.slot,
    required this.location,
    required this.startTime,
    required this.endTime,
  });

  factory Period.fromMap(Map<String, dynamic> map) {
    return Period(
      name: map['courseName'],
      code: map['code'],
      slot: map['slot'],
      location: map['location'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }
}
