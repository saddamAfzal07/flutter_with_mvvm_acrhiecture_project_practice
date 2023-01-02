class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  AppExceptions([this.message, this.prefix]);
  String toString() {
    return '$message $prefix';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorized request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input request');
}
