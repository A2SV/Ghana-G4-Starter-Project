import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

class UpdateBlogParams {
  final int id;
  final String title;
  final String body;
  final List<TagModel> tags;

  UpdateBlogParams({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
  });
}

class UpdateBlogUseCase extends UseCase<Blog, UpdateBlogParams> {
  final BlogRepository blogRepository;

  UpdateBlogUseCase({
    required this.blogRepository,
  });

  @override
  Future<Either<Failure, Blog>> call(
      UpdateBlogParams params) async {
    return await blogRepository.update(
      id: params.id,
      title: params.title,
      body: params.body,
      tags: params.tags,
    );
  }
}
