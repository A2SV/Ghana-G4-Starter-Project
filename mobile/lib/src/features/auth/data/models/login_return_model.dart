import 'package:hive/hive.dart';
import 'package:starter_project/src/core/models/user_account_model.dart';
import 'package:starter_project/src/features/auth/domain/domain.dart';
part 'login_return_model.g.dart';
@HiveType(typeId: 1)
class LoginReturnModel extends LoginReturn {
  @override
  @HiveField(0)
  final String token;
  @override
  @HiveField(1)
  final UserAccountModel userAccount;

  const LoginReturnModel({
    required this.token,
    required this.userAccount,
  }) : super(token: token, userAccount: userAccount);

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
