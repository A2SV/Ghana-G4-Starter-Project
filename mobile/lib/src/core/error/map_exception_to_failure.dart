import './error.dart';

Failure mapExceptionToFailure({required exception}) {
  switch (exception) {
    case CacheException _:
      return CacheFailure();
    case ServerException _:
      return ServerFailure();
    case NetworkException _:
      return NetworkFailure();
    case UnauthorizedRequestException _:
      return UnauthorizedRequestFailure();
    default:
      return DefaultFailure();
  }
}
