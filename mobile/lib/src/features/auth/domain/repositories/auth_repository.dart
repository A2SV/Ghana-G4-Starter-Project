import 'package:dartz/dartz.dart';
import 'package:starter_project/src/core/error/failure.dart';
import 'package:starter_project/src/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure ,User>> login(String email, String password) ;
    
}

