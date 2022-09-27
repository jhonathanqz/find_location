abstract class ServiceException implements Exception {
  final String message;

  ServiceException(this.message);
}

class ServiceNotFoundException extends ServiceException {
  ServiceNotFoundException(String message) : super(message);
}
