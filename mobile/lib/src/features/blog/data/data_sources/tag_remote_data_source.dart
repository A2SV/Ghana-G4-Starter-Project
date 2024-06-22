import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/src/core/constants/constants.dart';
import 'package:starter_project/src/core/error/error.dart';
import 'package:starter_project/src/features/blog/data/models/tag_model_b.dart';

abstract class TagRemoteDataSource {
  Future<List<TagModel>> viewAllTags();
}

class TagRemoteDataSourceImpl implements TagRemoteDataSource {
  final http.Client client;

  const TagRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<TagModel>> viewAllTags() async {
    String token = Hive.box(Constants.authBox).get(Constants.token);
    final response = await client.get(
      Uri.parse(Constants.viewTagsAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = json.decode(response.body);
      List<TagModel> tags = data.map((tag) => TagModel.fromJson(tag)).toList();
      return tags;
    } else {
      throw ServerException(errorMessage: 'Tag not found');
    }
  }
}
