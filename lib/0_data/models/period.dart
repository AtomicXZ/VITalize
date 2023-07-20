class Period {
  final String name;
  final String code;
  final String slot;
  final String location;
  final String startTime;
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
      name: map['name'],
      code: map['code'],
      slot: map['slot'],
      location: map['location'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }
}
