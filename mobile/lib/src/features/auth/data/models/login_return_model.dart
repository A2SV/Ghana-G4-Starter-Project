import 'package:starter_project/src/features/auth/data/models/user_account_model.dart';

import 'package:starter_project/src/features/auth/domain/domain.dart';

class LoginReturnModel extends LoginReturn {
  const LoginReturnModel({
    required super.token,
    required UserAccountModel super.userAccount,
  });

  factory LoginReturnModel.fromJson(Map<String, dynamic> json) {
    return LoginReturnModel(
      token: json['token'],
      userAccount: UserAccountModel.fromJson(json['userAccount']),
    );
  }

  @override
  List<Object?> get props => [token, userAccount];

  Map<String, dynamic> toJson() {
    return {'token': token, 'userAccount': userAccount};
  }
}
