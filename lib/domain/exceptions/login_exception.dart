abstract class LoginException implements Exception {
  final String message;

  LoginException(this.message);
}

class LoginNotFoundException extends LoginException {
  LoginNotFoundException(String message) : super(message);
}

class LoginErrorException extends LoginException {
  LoginErrorException(String message) : super(message);
}
