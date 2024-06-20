import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';

class LoginParams {
   final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

class LoginUseCase extends UseCase<LoginReturn, LoginParams>{
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, LoginReturn>> call(LoginParams params) async{
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}
