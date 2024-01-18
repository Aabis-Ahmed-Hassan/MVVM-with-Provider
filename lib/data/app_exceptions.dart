class AppException implements Exception {
  String? message;
  String? _prefix;

  AppException([this.message, this._prefix]);

  String toString() {
    return '$_prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized request');
}



class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');

}

