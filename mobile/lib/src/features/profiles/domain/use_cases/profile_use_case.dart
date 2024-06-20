import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/core/use_case/use_cases.dart';

import '../repositories/repository.dart';

class ViewProfileUseCase extends UseCase {
  final ProfileRepository profileRepository;

  ViewProfileUseCase({
    required this.profileRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
