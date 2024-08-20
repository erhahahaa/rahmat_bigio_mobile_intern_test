abstract class Failure {
  final String message;

  Failure({required this.message});

  @override
  String toString() => message;
}

// http
class ServerFailure extends Failure {
  final int statusCode;

  ServerFailure({
    this.statusCode = 500,
    super.message = 'Server Failure',
  });
}

// network
class NetworkFailure extends Failure {
  NetworkFailure({
    super.message = 'Network Failure',
  });
}

// local storage / cache
class CacheFailure extends Failure {
  CacheFailure({
    super.message = 'Cache Failure',
  });
}
