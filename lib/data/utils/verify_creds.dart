import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:vitalize/data/constants.dart';
import 'package:vitalize/data/utils/failure.dart';

Future<Either<ServerFailure, bool>> isValid(
    String username, String password) async {
  var req = await http.post(Uri.parse(verifyURL),
      body: {'username': username, 'password': password});
  if (req.statusCode == 200) {
    return const Right(true);
  } else if (req.statusCode == 403) {
    return Left(
      ServerFailure(
        message: 'Unauthorized Access',
        subtitle: 'You are not authorized to use this app.',
      ),
    );
  } else {
    return Left(
      ServerFailure(
        message: 'Invalid Credentials',
        subtitle: 'Please check your password and try again.',
      ),
    );
  }
}
