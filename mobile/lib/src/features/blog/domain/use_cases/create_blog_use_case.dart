import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

class CreateBlogParams {
  final String title;
  final String body;
  final List<TagModel> tags;

  CreateBlogParams({
    required this.title,
    required this.body,
    required this.tags,
  });
}

class CreateBlogUseCase extends UseCase<Blog, CreateBlogParams> {
  final BlogRepository blogRepository;

  CreateBlogUseCase({
    required this.blogRepository,
  });

  @override
  Future<Either<Failure, Blog>> call(
      CreateBlogParams params) async {
    return await blogRepository.create(
      title: params.title,
      body: params.body,
      tags: params.tags,
    );
  }
}