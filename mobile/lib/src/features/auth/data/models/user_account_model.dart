import 'package:starter_project/src/core/entities/user_account.dart';

class UserAccountModel extends UserAccount {
  const UserAccountModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.passwordHash,
    required super.passwordSalt,
    required super.createdDateTime,
    required super.lastUpdatedDateTime,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      passwordHash: json['passwordHash'],
      passwordSalt: json['passwordSalt'],
      createdDateTime: DateTime.parse(json['createdDateTime']),
      lastUpdatedDateTime: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'passwordHash': passwordHash,
      'passwordSalt': passwordSalt,
      'createdDateTime': createdDateTime?.toIso8601String(),
      'lastUpdatedDateTime': lastUpdatedDateTime?.toIso8601String(),
    };
  }
}
