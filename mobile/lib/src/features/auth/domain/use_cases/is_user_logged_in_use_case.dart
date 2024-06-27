import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/error.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/auth/authentication.dart';

class IsUserLoggedInUseCase extends UseCase<LoginReturn, NoParams> {
  final AuthRepository authRepository;

  IsUserLoggedInUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, LoginReturn>> call(NoParams params) {
    return Future.value(authRepository.getUser());
  }
}
