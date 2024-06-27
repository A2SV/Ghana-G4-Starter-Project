part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}
final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
final class AuthLoggedOut extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserAccount user;
  const AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}
