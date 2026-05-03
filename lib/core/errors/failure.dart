/// Base Failure class for domain layer error handling
abstract class Failure {
  /// The error message
  final String? message;

  const Failure({this.message});

  @override
  String toString() => message ?? 'An error occurred';
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({String? message})
      : super(message: message ?? 'Network error occurred');
}

/// Server-related failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({String? message, this.statusCode})
      : super(message: message ?? 'Server error occurred');
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({String? message})
      : super(message: message ?? 'Cache error occurred');
}

/// Generic exception failure
class ExceptionFailure extends Failure {
  const ExceptionFailure({String? message})
      : super(message: message ?? 'Unexpected error occurred');
}
