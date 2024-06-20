import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';

import '../repositories/repository.dart';

class ViewBlogUseCase extends UseCase {
  final BlogRepository blogRepository;

  ViewBlogUseCase({
    required this.blogRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
