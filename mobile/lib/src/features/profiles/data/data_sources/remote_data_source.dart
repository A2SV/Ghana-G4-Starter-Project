import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/src/features/profiles/data/data.dart';

abstract class RemoteDataSource {
  Future<Either<String,UserAccountModel>> getAccount({required int? id});
  Future<String> updateAccount({
    required int? id,
    required String? firstName,
    required String? lastName,
    required String? email,
  });
}

String token='eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiTWlraSBUYW1lIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWlraUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIxIiwiZXhwIjoxNzE4OTY4MTgyfQ.QP60v4QYqHgrcTAws6qSNtjiXPmwr7-qg2JL3uafiur2pPcrRuwAEUJgSFfXRSPyMroVCrgb8mza559VBwRlbg';


class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Either<String,UserAccountModel>> getAccount({required int? id}) async {

    final response = await http.get(Uri.parse(

        'http://blogapp.tryasp.net/api/UserAccount/${id}'),

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
      UserAccountModel blog= UserAccountModel.fromJson(data);
      return Right(blog);
    } else {
      print('failed to load data');

      return Left('Failed to load data');
    }

  }

  @override
  Future<String> updateAccount({required int? id, required String? firstName, required String? lastName, required String? email}) async{
    // TODO: implement updateAccount
    final url = Uri.parse('http://blogapp.tryasp.net/api/UserAccount/update');

    final Map<String, dynamic> data = {
      'id': id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email
    };


    final body = json.encode(data);

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print('Request successful: ${response.body}');
      return 'Request successful: ${response.body}' ;
    } else {
      print('Request failed: ${response.statusCode}');
      return 'Request failed: ${response.statusCode}';
    }

  }


}
