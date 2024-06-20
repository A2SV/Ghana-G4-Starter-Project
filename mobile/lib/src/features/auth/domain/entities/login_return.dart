import 'package:equatable/equatable.dart';
import 'package:starter_project/src/core/core.dart';

class LoginReturn extends Equatable {
  final String token;
  final UserAccount userAccount;

  const LoginReturn({
    required this.token,
    required this.userAccount,
  });

  @override
  List<Object?> get props => [token, userAccount];
}
