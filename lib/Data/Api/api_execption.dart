///
/// Class for manages execption during API Calls
///
class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = 'An Unknown Error Occured.', this.prefix]);

  factory AppException.code(String code) {
    switch (code) {
      case 'weak-password':
        return AppException.code('Please enter a strong password');
      case 'invalid-email':
        return AppException.code('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return AppException.code('An email already exists');
      case 'operation-not-allowed':
        return AppException.code(
            'Operation not allowed. please contact support');
      case 'user-disabled':
        return AppException.code('user has been disabled');
      default:
        return AppException();
    }
  }

  @override
  String toString() {
    return "$prefix$message";
  }
}

///
/// Execption during fetch data from server
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message!, "Error During Communication: ");
}

///
/// Execption during send bad request or parameter missing
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

///
/// Execption during fetching unauthorised data
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

///
/// Execption during giving invalidinput to server
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message!, "Invalid Input: ");
}
