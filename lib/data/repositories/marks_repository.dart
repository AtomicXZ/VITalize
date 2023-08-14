import 'package:either_dart/either.dart';
import 'package:vitalize/data/models/marks.dart';
import 'package:vitalize/data/repositories/api_repository.dart';
import 'package:vitalize/data/utils/failure.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class MarksRepository {
  APIRepository apiRepository = APIRepository();

  Future<Either<Failure, Map<dynamic, Marks>>> getMarksFromApi(
      String semID) async {
    if (await serverAvailable) {
      Map<String, Marks> marks = await apiRepository.getMarks(semID);
      return Right(marks);
    } else {
      return Left(ServerFailure());
    }
  }
}
