import 'package:equatable/equatable.dart';
import 'exception.dart';

abstract class Failure extends Equatable {
  abstract final String errorMessage;
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  final String errorMessage;
  ServerFailure({this.errorMessage = 'Server failure'});
}

class CacheFailure extends Failure {
  @override
  final String errorMessage;
  CacheFailure({this.errorMessage = 'Cache failure'});
}

class NetworkFailure extends Failure {
  @override
  final String errorMessage;
  NetworkFailure({this.errorMessage = 'No internet connection'});
}

class UnauthorizedRequestFailure extends Failure {
  @override
  final String errorMessage;

  UnauthorizedRequestFailure({this.errorMessage = 'User not authenticated'});
}

class AnonymousFailure extends Failure {
  @override
  final String errorMessage;
  AnonymousFailure({this.errorMessage = 'Unknown error happened'});
}

class DefaultFailure extends Failure {
  @override
  final String errorMessage;
  DefaultFailure({this.errorMessage = 'Something went wrong'});
}

class SignInWithGoogleFailure extends Failure {
  @override
  final String errorMessage;

  SignInWithGoogleFailure({
    this.errorMessage = 'Sign In With Google Failed',
  });
}

SignInWithGoogleFailure handleGoogleSignInException(
    SignInWithGoogleException exception) {
  return SignInWithGoogleFailure(errorMessage: exception.errorMessage);
}

class SignOutWithGoogleFailure extends Failure {
  @override
  final String errorMessage;

  SignOutWithGoogleFailure({
    this.errorMessage = 'Sign Out With Google Failed',
  });
}

SignOutWithGoogleFailure handleGoogleSignOutException(
    SignOutWithGoogleException exception) {
  return SignOutWithGoogleFailure(errorMessage: exception.errorMessage);
}

class SignInWithFacebookFailure extends Failure {
  @override
  final String errorMessage;

  SignInWithFacebookFailure({
    this.errorMessage = 'Sign In With Facebook Failed',
  });
}

SignInWithFacebookFailure handleFacebookSignInException(
    SignInWithFacebookException exception) {
  return SignInWithFacebookFailure(errorMessage: exception.errorMessage);
}

class SignOutWithFacebookFailure extends Failure {
  @override
  final String errorMessage;

  SignOutWithFacebookFailure({
    this.errorMessage = 'Sign Out With Google Failed',
  });
}

SignOutWithFacebookFailure handleFacebookSignOutException(
    SignOutWithFacebookException exception) {
  return SignOutWithFacebookFailure(errorMessage: exception.errorMessage);
}
