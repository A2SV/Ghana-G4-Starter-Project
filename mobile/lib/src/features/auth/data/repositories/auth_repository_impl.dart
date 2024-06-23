import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/network/network.dart';
import 'package:starter_project/src/features/auth/authentication.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final Network network;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.network,
  });
  @override
  Either<Failure, LoginReturn> getUser() {
    try {
      final loginReturn = localDataSource.getUser();
      return Right(loginReturn);
    } catch (e) {}
    return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, LoginReturnModel>> login({
    required String email,
    required String password,
  }) async {
    if (await network.isConnected) {
      try {
        final loginReturn =
            await remoteDataSource.login(email: email, password: password);
        await localDataSource.saveLoginReturn(loginReturn);
        return Right(loginReturn);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      } on CacheException {
        return Left(
            CacheFailure(errorMessage: 'User could not be stored locally'));
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

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      return Right(await localDataSource.logOut());
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'Could not remove user locally'));
    }
  }
}
