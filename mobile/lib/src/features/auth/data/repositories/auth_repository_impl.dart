import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/network/network.dart';
import 'package:starter_project/src/features/auth/authentication.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final Network network;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.network,
  });
  @override
  Future<Either<Failure, LoginReturnModel>> login({
    required String email,
    required String password,
  }) async {
    if (await network.isConnected) {
      try {
        final loginReturn =
            await remoteDataSource.login(email: email, password: password);
        return Right(loginReturn);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserAccountModel>> register({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
  }) async {
    if (await network.isConnected) {
      try {
        final userAccount = await remoteDataSource.register(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password);
        return Right(userAccount);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
