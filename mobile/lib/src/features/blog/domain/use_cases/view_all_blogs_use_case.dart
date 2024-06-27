import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog_b.dart';

import '../repositories/repository.dart';

class ViewAllBlogUseCase extends UseCase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;

  ViewAllBlogUseCase({
    required this.blogRepository,
  });
  @override
  Future<Either<Failure, List<Blog>>> call(params) async {
    return await blogRepository.viewAllBlogs();
  }
}
