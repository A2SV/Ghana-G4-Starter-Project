import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/features/blog/domain/entities/entities.dart';

abstract class BlogRepository {
  Future<Either<Failure, Blog>> create({
    required String title,
    required String body,
    required List<Tag> tags,
  });
  Future<Either<Failure, Blog>> update({
    required String id,
    required String? title,
    required String? body,
    required List<Tag>? tags,
  });
}
