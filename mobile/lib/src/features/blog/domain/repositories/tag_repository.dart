import 'package:dartz/dartz.dart';
import 'package:starter_project/src/features/blog/domain/entities/tags.dart';

abstract class TagRepository {
  Future<Either<String, List<Tag>>> viewAllTags();
}
