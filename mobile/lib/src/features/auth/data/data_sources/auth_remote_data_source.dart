import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/features/auth/data/models/login_return_model.dart';
import 'package:starter_project/src/features/auth/data/models/user_account_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginReturnModel> login({
    required String email,
    required String password,
  });
  Future<UserAccountModel> register({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginReturnModel> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse(Constants.loginAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {'email': email, 'password': password},
      ),
    );

    if (response.statusCode == 200) {
      return LoginReturnModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<UserAccountModel> register({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse(Constants.registerAPIEndpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password
        },
      ),
    );
    if (response.statusCode == 200) {
      return UserAccountModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(errorMessage: response.body);
    }
  }
}
