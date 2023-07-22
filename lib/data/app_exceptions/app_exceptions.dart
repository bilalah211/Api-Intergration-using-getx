class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class InternetException extends AppException {
  InternetException(String? message) : super(message, 'No Internet Connection');
}

class RequestTimeOut extends AppException {
  RequestTimeOut(String? message) : super(message, 'Request Time Out');
}

class FetchDataException extends AppException {
  FetchDataException(String? message)
      : super(message, 'Error While Communication with Server');
}

class InvalidUser extends AppException {
  InvalidUser(String? message) : super(message, 'User is Invalid');
}
