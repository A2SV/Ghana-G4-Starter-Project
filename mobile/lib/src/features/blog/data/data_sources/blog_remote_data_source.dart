import 'package:starter_project/src/features/blog/data/models/blog_model.dart';
import 'package:starter_project/src/features/blog/data/models/tag_model.dart';

import '../../domain/domain.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';

String token =
    'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiTWlraSBUYW1lIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWlraUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxIiwiZXhwIjoxNzE4OTY4MTgyfQ.QP60v4QYqHgrcTAws6qSNtjiXPmwr7-qg2JL3uafiur2pPcrRuwAEUJgSFfXRSPyMroVCrgb8mza559VBwRlbg';

abstract class BlogRemoteDataSource {
  //methods
  Future<Either<String, BlogModel>> viewBlog(int id);
  Future<Either<String, List<BlogModel>>> viewAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  Future<Either<String, BlogModel>> viewBlog(int id) async {
    final response = await http.get(
      Uri.parse('http://blogapp.tryasp.net/api/Blog/${id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include the auth token
      },
    );

    print('Loading from data source......');

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> data = json.decode(response.body);
      //print('Data: $data');
      BlogModel blog = BlogModel.fromJson(data);
      return Right(blog);
    } else {
      print('failed to load data');
      // If the server did not return a 200 OK response, throw an exception.
      //throw Exception('Failed to load data');
      return Left('Failed to load data');
    }
  }

  Future<Either<String, List<BlogModel>>> viewAllBlogs() async {
    final response = await http.get(
      Uri.parse('http://blogapp.tryasp.net/api/Blog'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include the auth token
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      print('Response body: ${json.decode(response.body)}');

      List<dynamic> data = json.decode(response.body);
      //print('Data: $data');
      List<BlogModel> blogs = [];
      print(response.body);

      for (var item in data) {
        blogs.add(BlogModel.fromJson(item));
      }
      print(blogs);
      return Right(blogs);
    } else {
      print('failed to load data');
      // If the server did not return a 200 OK response, throw an exception.
      //throw Exception('Failed to load data');
      return Left('Failed to load data');
    }
  }
}
