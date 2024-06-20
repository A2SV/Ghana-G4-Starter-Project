import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';
import 'package:starter_project/src/features/blog/domain/repositories/tag_repository.dart';

import '../repositories/repository.dart';

class ViewTagUseCase extends UseCase {
  final TagRepository tagRepository;

  ViewTagUseCase({
    required this.tagRepository,
  });

  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
