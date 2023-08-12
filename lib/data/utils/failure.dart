abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  final String subtitle;

  ServerFailure({this.message = '', this.subtitle = ''});
}
