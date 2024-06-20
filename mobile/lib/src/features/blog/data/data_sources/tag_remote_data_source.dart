import 'package:hive/hive.dart';
import 'package:starter_project/src/core/constants/constants.dart';
import 'package:starter_project/src/features/blog/data/models/blog_model.dart';
import 'package:starter_project/src/features/blog/data/models/tag_model.dart';

import '../../domain/domain.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';

String token = Hive.box(Constants.authBox).get(Constants.token);

abstract class TagRemoteDataSource {
  //methods
  Future<Either<String, List<TagModel>>> viewAllTags();
}

class TagRemoteDataSourceImpl implements TagRemoteDataSource {
  @override
  Future<Either<String, List<TagModel>>> viewAllTags() async {
    final response = await http.get(
      Uri.parse('http://blogapp.tryasp.net/api/Tag'),
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
      List<TagModel> tags = [];
      print(response.body);

      for (var item in data) {
        tags.add(TagModel.fromJson(item));
      }
      print(tags);
      return Right(tags);
    } else {
      print('failed to load data');
      // If the server did not return a 200 OK response, throw an exception.
      //throw Exception('Failed to load data');
      return Left('Failed to load data');
    }
  }
}
