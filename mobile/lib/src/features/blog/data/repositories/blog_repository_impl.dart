import 'package:dartz/dartz.dart';

import 'package:starter_project/src/core/error/failure.dart';

import 'package:starter_project/src/features/blog/domain/entities/blog.dart';

import 'package:starter_project/src/features/blog/domain/entities/tag.dart';
import 'package:starter_project/src/features/blog/domain/repositories/repository.dart';


class AuthRepositoryImpl implements BlogRepository {
  @override
  Future<Either<Failure, Blog>> create({required String title, required String body, required List<Tag> tags}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Blog>> update({required String id, required String? title, required String? body, required List<Tag>? tags}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
