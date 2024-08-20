abstract class Failure {
  final String message;

  const Failure(this.message);
}

// http
class ServerFailure extends Failure {
  final int statusCode;

  const ServerFailure({
    this.statusCode = 500,
    String message = 'Server Failure',
  }) : super(message);
}

// network
class NetworkFailure extends Failure {
  const NetworkFailure({
    String message = 'Network Failure',
  }) : super(message);
}

// local storage / cache
class CacheFailure extends Failure {
  const CacheFailure({
    String message = 'Cache Failure',
  }) : super(message);
}

class StorageFailure extends Failure {
  const StorageFailure({
    String message = 'Storage Failure',
  }) : super(message);
}
