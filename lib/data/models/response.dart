enum ResponseStatus { success, failure, fromBox }

class Response<T> {
  final T response;
  final ResponseStatus status;

  Response(this.response, this.status);

  static bool responseStatus(ResponseStatus status) {
    return status == ResponseStatus.success || status == ResponseStatus.fromBox
        ? true
        : false;
  }
}
