import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_case.dart';
import 'package:starter_project/src/features/blog/domain/entities/tag_b.dart';
import 'package:starter_project/src/features/blog/domain/repositories/tag_repository.dart';

class ViewTagsUseCase extends UseCase<List<Tag>, NoParams> {
  final TagRepository tagRepository;

  ViewTagsUseCase({
    required this.tagRepository,
  });
  @override
  Future<Either<Failure, List<Tag>>> call(NoParams params) async {
    return await tagRepository.viewAllTags();
  }
}
