import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

import '../../domain/domain.dart';
import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

import '../../domain/domain.dart';
import '../../domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/blog_remote_data_source.dart';
import '../models/blog_model.dart';
import '../models/tag_model.dart';

class BlogRepositoryImpl implements BlogRepository {
  Future<Either<String,Blog>> viewBlog(int id) async{
    Either<String,BlogModel> result= await BlogRemoteDataSourceImpl().viewBlog(id);
    var output;
    bool iserror=false;

    print('extracting from repo....');
    result.fold(
        (error)=>iserror=true,
        (data)=>output=Blog(data.id, data.title, data.body, data.createdDateTime,
            UserAccount(data.userAccount.id,data.userAccount.firstName,data.userAccount.lastName,data.userAccount.email,data.userAccount.createdDateTime),
            convertTagModels(data.tag))
    );

    if(iserror){
      return Left('Extraction failed');
    }else{
      return Right(output);
    }
  }

  Future<Either<String,List<Blog>>> viewAllBlogs() async{
    Either<String,List<BlogModel>> result= await BlogRemoteDataSourceImpl().viewAllBlogs();
    List<BlogModel> dataList=[];
    List<Blog> output=[];
    bool iserror=false;

    print('extracting from repo....');
    
    result.fold(
            (error)=>iserror=true,
            (data)=>dataList=data
    );

    if(iserror){
      return Left('Extraction failed');
    }else{
      for (BlogModel data in dataList){
        var tags=convertTagModels(data.tag);

        output.add(
            Blog(data.id, data.title, data.body, data.createdDateTime,
            UserAccount(data.userAccount.id,data.userAccount.firstName,
            data.userAccount.lastName,data.userAccount.email,
            data.userAccount.createdDateTime), tags)
        );

      }
      return Right(output);
    }

    print(output);

  }
}

List<Tag> convertTagModels(List<TagModel> tagModels){
  List<Tag> output=[];

  for (TagModel tag in tagModels){
    output.add(Tag(tag.id, tag.label, tag.description));
  }
  
  print('converted${output}');

  return output;
}