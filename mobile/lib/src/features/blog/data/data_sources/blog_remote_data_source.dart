import 'package:starter_project/src/features/blog/data/models/blog_model.dart';

import '../../domain/domain.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';

abstract class BlogRemoteDataSource {

//methods
Future<Either<String,BlogModel>> viewBlog(int id);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {

  Future<Either<String,BlogModel>> viewBlog(int id)async{
    final response = await http.get(Uri.parse('http://blogapp.tryasp.net/api/Blog/${id}'));

    print('Loading from data source');

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> data = json.decode(response.body);
      print('Data: $data');
      BlogModel blog= BlogModel.fromJson(data);
      return Right(blog);
    } else {
      print('failed to load data');
      // If the server did not return a 200 OK response, throw an exception.
      //throw Exception('Failed to load data');
      return Left('Failed to load data');
    }
  }


}
