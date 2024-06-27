import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/dp_injection/dp_injection.dart';
import 'package:starter_project/src/core/entities/user_account.dart';
import 'package:starter_project/src/core/use_case/use_case.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';
import 'package:starter_project/src/features/auth/domain/use_cases/is_user_logged_in_use_case.dart';
import 'package:starter_project/src/features/auth/domain/use_cases/logout_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogOutUseCase _logOutUseCase;
  final IsUserLoggedInUseCase _isUserLoggedInUseCase;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required RegisterUseCase registerUseCase,
    required LoginUseCase loginUseCase,
    required AppUserCubit appUserCubit,
    required LogOutUseCase logOutUseCase,
    required IsUserLoggedInUseCase isUserLoggedInUseCase,
  })  : _registerUseCase = registerUseCase,
        _loginUseCase = loginUseCase,
        _appUserCubit = appUserCubit,
        _logOutUseCase = logOutUseCase,
        _isUserLoggedInUseCase = isUserLoggedInUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthRegister>(_onAuthRegister);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<AuthLogOut>(_onAuthLogOut);
  }

  FutureOr<void> _onAuthRegister(
      AuthRegister event, Emitter<AuthState> emit) async {
    final res = await _registerUseCase(
      RegisterParams(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.errorMessage)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(
    UserAccount user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }

  FutureOr<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final res = await _loginUseCase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(l.errorMessage)),
      (r) => _emitAuthSuccess(r.userAccount, emit),
    );
  }

  FutureOr<void> _isUserLoggedIn(AuthIsUserLoggedIn event, Emitter<AuthState> emit) async{
    final res = await _isUserLoggedInUseCase(NoParams());

    res.fold(
      (l) => emit(AuthFailure(l.errorMessage)),
      (r) => _emitAuthSuccess(r.userAccount, emit),
    );
  }

  FutureOr<void> _onAuthLogOut(AuthLogOut event, Emitter<AuthState> emit)async {
     final res = await _logOutUseCase(NoParams());

    res.fold(
      (l) => emit(AuthFailure(l.errorMessage)),
      (r) => emit(AuthLoggedOut()),
    );
  }
}
