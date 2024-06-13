import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

import '../../domain/domain.dart';
import '../../domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/blog_remote_data_source.dart';
import '../models/blog_model.dart';

class BlogRepositoryImpl implements BlogRepository {
  Future<Either<String,Blog>> viewBlog(int id) async{
    Either<String,BlogModel> result= await BlogRemoteDataSourceImpl().viewBlog(id);
    var output;
    result.fold(
        (error)=>output=error,
        (data)=>output=Blog(data.id, data.title, data.body, data.createdDateTime, data.lastUpdatedDateTime,
            UserAccount(data.userAccount.id,data.userAccount.firstName,data.userAccount.lastName,data.userAccount.email,data.userAccount.createdDateTime),
            Tag(data.tag.id,data.tag.label,data.tag.description))
    );
    return output;
  }
}
