
import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserAccount>> register({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, LoginReturn>> login({
    required String email,
    required String password,
  });
  Either<Failure, LoginReturn> getUser();
  Future<Either<Failure, void>> logOut();
}
