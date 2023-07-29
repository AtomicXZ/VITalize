import 'package:vtop_app/0_data/models/marks.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/0_data/repositories/api_repository.dart';

class MarksRepository {
  APIRepository apiRepository = APIRepository();
  Future<Map<dynamic, Marks>> getMarksFromApi(String semID) async {
    if (await serverAvailable) {
      Map<dynamic, String> user = getCreds;

      Map<String, Marks> marks = await apiRepository.getMarks(
          user['username']!, user['password']!, semID);
      if (marks.isNotEmpty) {
        return marks;
      }
    }
    return {};
  }
}
