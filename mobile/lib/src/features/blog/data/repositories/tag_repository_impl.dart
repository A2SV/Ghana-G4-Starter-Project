import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

import '../../domain/domain.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/tag_repository.dart';
import '../data_sources/tag_remote_data_source.dart';
import '../models/blog_model.dart';
import '../models/tag_model.dart';

class TagRepositoryImpl implements TagRepository {
  @override
  Future<Either<String, List<Tag>>> viewAllTags() async {
    Either<String, List<TagModel>> result =
        await TagRemoteDataSourceImpl().viewAllTags();
    List<TagModel> tagList = [];
    List<Tag> output = [];
    bool isError = false;

    print('extracting from repo....');

    result.fold((error) => isError = true, (data) => tagList = data);

    if (isError) {
      return Left('Extraction failed');
    } else {
      for (TagModel data in tagList) {
        output.add(
          Tag(
            data.id,
            data.label,
            data.description,
          ),
        );
      }
      return Right(output);
    }
    throw UnimplementedError();
  }
}
