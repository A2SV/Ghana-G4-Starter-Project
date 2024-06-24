import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/features/auth/authentication.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

abstract class BlogRemoteDataSource {
  Future<Blog> create({
    required String title,
    required String body,
    required List<TagModel> tags,
  });
  Future<String> delete({
    required int id,
  });
  Future<Blog> update({
    required int id,
    required String? title,
    required String? body,
    required List<TagModel>? tags,
  });

  Future<List<BlogModel>> viewMyBlogs();
  Future<List<BlogModel>> viewAllBlogs();
  Future<BlogModel> viewBlog(int id);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final http.Client client;
  final Box<LoginReturnModel> box;
  BlogRemoteDataSourceImpl({
    required this.client,
    required this.box,
  });
  @override
  Future<Blog> create(
      {required String title,
      required String body,
      required List<TagModel> tags}) async {
    final token = box.get(Constants.loginReturn)!.token;
    final response = await client.post(
      Uri.parse(Constants.createBlogAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "title": title,
        "body": body,
        "tags": tags.map((e) => e.toJson()).toList()
      }),
    );
    if (response.statusCode == 200) {
      return BlogModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<String> delete({required int id}) async {
    final token = box.get(Constants.loginReturn)!.token;
    final response = await client.delete(
      Uri.parse('${Constants.deleteBlogAPIEndpoint}$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      return 'Blog deleted successfully';
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<Blog> update(
      {required int id,
      required String? title,
      required String? body,
      required List<Tag>? tags}) async {
    final token = box.get(Constants.loginReturn)!.token;
    final response = await client.post(
      Uri.parse(Constants.updateBlogAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({"id": id, "title": title, "body": body, "tags": tags}),
    );
    if (response.statusCode == 200) {
      return BlogModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<List<BlogModel>> viewAllBlogs() async {
    final token = box.get(Constants.loginReturn)!.token;
    final response = await http.get(
      Uri.parse(Constants.viewBlogsAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<BlogModel> blogs = [];
      for (var item in data) {
        blogs.add(BlogModel.fromJson(item));
      }
      return blogs;
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<BlogModel> viewBlog(int id) async {
    final token = box.get(Constants.loginReturn)!.token;
    final response = await http.get(
      Uri.parse('${Constants.viewBlogsAPIEndpoint}$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return BlogModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(errorMessage: 'Blog not found');
    }
  }

  @override
  Future<List<BlogModel>> viewMyBlogs() async {
    final loginReturn = box.get(Constants.loginReturn);
    final response = await http.get(
      Uri.parse(
          '${Constants.viewMyBlogsAPIEndpoint}${loginReturn!.userAccount.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginReturn.token}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<BlogModel> blogs = [];
      for (var item in data) {
        blogs.add(BlogModel.fromJson(item));
      }
      return blogs;
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }
}
