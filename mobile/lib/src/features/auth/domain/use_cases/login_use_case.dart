import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/auth/domain/entities/user.dart';

import '../repositories/repository.dart';

class LoginUseCase extends UseCase {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, User>> call(params) {
    return authRepository.login(params.email, params.password);
  }
}
