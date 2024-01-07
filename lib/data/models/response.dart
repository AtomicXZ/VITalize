enum ResponseStatus { success, failure, fromBox }

class Response<T> {
  final T response;
  final ResponseStatus status;

  Response(this.response, this.status);
  Response.bool(this.response, bool status)
      : status = status ? ResponseStatus.success : ResponseStatus.failure;

  static bool responseStatus(ResponseStatus status) {
    return status == ResponseStatus.success || status == ResponseStatus.fromBox
        ? true
        : false;
  }
}
