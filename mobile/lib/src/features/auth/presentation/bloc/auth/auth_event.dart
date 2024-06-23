part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthIsUserLoggedIn extends AuthEvent {}
final class AuthLogOut extends AuthEvent {}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthRegister extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const AuthRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}
