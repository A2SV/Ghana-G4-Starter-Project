import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';

import '../repositories/repository.dart';

class LoginUseCase extends UseCase {
  final BlogRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
