import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_project/src/core/core.dart';
import 'package:starter_project/src/core/error/exception.dart';
import 'package:starter_project/src/features/auth/authentication.dart';

abstract class AuthLocalDataSource {
  LoginReturnModel getUser();
  Future<void> saveLoginReturn(LoginReturnModel loginReturn_);
  Future<void> logOut();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<LoginReturnModel> hiveBox;
  AuthLocalDataSourceImpl({required this.hiveBox});

  @override
  LoginReturnModel getUser() {
    final loginReturn = hiveBox.get(Constants.loginReturn);
    if (loginReturn != null) {
      return loginReturn;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveLoginReturn(LoginReturnModel loginReturn_) async {
    try {
      await hiveBox.put(Constants.loginReturn, loginReturn_);
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await hiveBox.delete(Constants.loginReturn);
    } on Exception {
      throw CacheException();
    }
  }
}
