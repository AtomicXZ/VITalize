import 'package:vtop_app/0_data/models/marks.dart';

Map<String, Marks> parseMarks(Map<String, dynamic> data) {
  Map<String, Marks> marks = {};

  data.forEach((key, value) {
    Map<String, Map<String, String>> resultMarksMap = {};

    value['marks'].forEach((key, value) {
      Map<String, String> tempMap = Map.from(value)
        ..updateAll((key, value) => value.toString());
      resultMarksMap[key] = tempMap;
    });

    marks[key] = Marks.fromMap(Map.from(value)..['marks'] = resultMarksMap);
  });

  return marks;
}
