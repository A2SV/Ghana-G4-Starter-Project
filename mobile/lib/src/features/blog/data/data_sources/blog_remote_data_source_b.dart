import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

abstract class BlogRemoteDataSource {
  Future<Blog> create({
    required String title,
    required String body,
    required List<TagModel> tags,
  });
  Future<Blog> update({
    required int id,
    required String? title,
    required String? body,
    required List<TagModel>? tags,
  });
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final http.Client client;
  BlogRemoteDataSourceImpl({required this.client});
  @override
  Future<Blog> create(
      {required String title,
      required String body,
      required List<TagModel> tags}) async {
    final token = Hive.box(Constants.authBox).get(Constants.token) ?? "";
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
  Future<Blog> update(
      {required int id,
      required String? title,
      required String? body,
      required List<Tag>? tags}) async {
    final token = Hive.box(Constants.authBox).get(Constants.token) ?? "";
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
}
