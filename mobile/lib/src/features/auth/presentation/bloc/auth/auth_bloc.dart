import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/cubits/app_user/app_user_cubit.dart';
import 'package:starter_project/src/core/entities/user_account.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required RegisterUseCase registerUseCase,
    required LoginUseCase loginUseCase,
    required AppUserCubit appUserCubit,
  })  : _registerUseCase = registerUseCase,
        _loginUseCase = loginUseCase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthRegister>(_onAuthRegister);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  FutureOr<void> _onAuthRegister(AuthRegister event, Emitter<AuthState> emit)  async {
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

  FutureOr<void> _isUserLoggedIn(AuthIsUserLoggedIn event, Emitter<AuthState> emit) {
  }
}
