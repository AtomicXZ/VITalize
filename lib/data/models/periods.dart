import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/data/models/period.dart';

part 'periods.g.dart';

@HiveType(typeId: 2)
class Periods extends HiveObject {
  @HiveField(0)
  final List<Period> periods;

  Periods(this.periods);
}
