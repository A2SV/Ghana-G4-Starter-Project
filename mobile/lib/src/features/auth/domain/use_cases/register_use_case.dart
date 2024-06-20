import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/error.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';

class RegisterParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

class RegisterUseCase extends UseCase<UserAccount, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserAccount>> call(RegisterParams params) async {
    return await authRepository.register(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
    );
  }
}
