import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/network/network.dart';
import 'package:starter_project/src/features/blog/data/data_sources/data_sources.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog_b.dart';
import 'package:starter_project/src/features/blog/domain/repositories/repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource remoteDataSource;

  final Network network;

  BlogRepositoryImpl({
    required this.remoteDataSource,
    required this.network,
  });
  @override
  Future<Either<Failure, Blog>> create(
      {required String title,
      required String body,
      required List<TagModel> tags}) async {
    if (await network.isConnected) {
      try {
        final blog = await remoteDataSource.create(
          title: title,
          body: body,
          tags: tags,
        );
        return Right(blog);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    if (await network.isConnected) {
      try {
        final message = await remoteDataSource.delete(
          id: id,
        );
        return Right(message);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Blog>> update(
      {required int id,
      required String? title,
      required String? body,
      required List<TagModel>? tags}) async {
    if (await network.isConnected) {
      try {
        final blog = await remoteDataSource.update(
          id: id,
          title: title,
          body: body,
          tags: tags,
        );
        return Right(blog);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> viewAllBlogs() async {
    if (await network.isConnected) {
      try {
        final message = await remoteDataSource.viewAllBlogs();
        return Right(message);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Blog>> viewBlog(int id) async {
    if (await network.isConnected) {
      try {
        final message = await remoteDataSource.viewBlog(id);
        return Right(message);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(errorMessage: e.errorMessage ?? "Server Error"));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
