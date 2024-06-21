import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

class DeleteBlogParams {
  final int id;

  DeleteBlogParams({
    required this.id,
  });
}

class DeleteBlogUseCase extends UseCase<String, DeleteBlogParams> {
  final BlogRepository blogRepository;

  DeleteBlogUseCase({
    required this.blogRepository,
  });

  @override
  Future<Either<Failure, String>> call(
      DeleteBlogParams params) async {
    return await blogRepository.delete(
      id: params.id,
    );
  }
}