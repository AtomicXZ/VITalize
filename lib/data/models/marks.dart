class Marks {
  final String name;
  final String type;
  final String professor;
  final String slot;
  final Map<String, Map<String, String>> marks;

  Marks({
    required this.name,
    required this.type,
    required this.professor,
    required this.slot,
    required this.marks,
  });

  factory Marks.fromMap(Map<String, dynamic> map) {
    return Marks(
      name: map['courseName'],
      type: map['courseType'],
      professor: map['professor'],
      slot: map['courseSlot'],
      marks: map['marks'],
    );
  }
}
