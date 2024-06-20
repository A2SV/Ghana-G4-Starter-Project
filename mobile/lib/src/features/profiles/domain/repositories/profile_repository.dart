import 'package:dartz/dartz.dart';

import '../domain.dart';


abstract class ProfileRepository {
  Future<Either<String,UserAccount>> getAccount(int id);
  Future<String> updateAccount(int id, String firstName, String lastName, String email);
}
