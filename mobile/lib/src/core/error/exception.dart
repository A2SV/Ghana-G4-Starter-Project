class ServerException implements Exception {
  final String? errorMessage;
  ServerException({
    this.errorMessage,
  });
}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class UnauthorizedRequestException implements Exception {}

class DefaultException implements Exception {}

class SignInWithGoogleException implements Exception {
  final String errorMessage;

  SignInWithGoogleException({
    required this.errorMessage,
  });
}

class SignOutWithGoogleException implements Exception {
  final String errorMessage;

  SignOutWithGoogleException({
    required this.errorMessage,
  });
}

class SignInWithFacebookException implements Exception {
  final String errorMessage;

  SignInWithFacebookException({
    required this.errorMessage,
  });
}

class SignOutWithFacebookException implements Exception {
  final String errorMessage;
  SignOutWithFacebookException({
    required this.errorMessage,
  });
}
