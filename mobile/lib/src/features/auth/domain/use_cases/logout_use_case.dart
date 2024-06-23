import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/error.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';

class LogOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogOutUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logOut();
  }
}
