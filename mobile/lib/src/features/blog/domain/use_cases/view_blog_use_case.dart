import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_case.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog_b.dart';

import '../repositories/repository.dart';

class ViewBlogParams {
  final int id;
  const ViewBlogParams({required this.id});
}

class ViewBlogUseCase extends UseCase<Blog, ViewBlogParams> {
  final BlogRepository blogRepository;

  ViewBlogUseCase({
    required this.blogRepository,
  });
  @override
  Future<Either<Failure, Blog>> call(ViewBlogParams params) async {
    return await blogRepository.viewBlog(params.id);
  }
}
