import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/error.dart';
import 'package:starter_project/src/features/blog/domain/entities/tag_b.dart';

abstract class TagRepository {
  Future<Either<Failure, List<Tag>>> viewAllTags();
}
