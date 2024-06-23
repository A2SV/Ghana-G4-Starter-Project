import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter_project/src/core/entities/user_account.dart';
part 'user_account_model.g.dart';
@HiveType(typeId: 2)
class UserAccountModel extends UserAccount {
  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? firstName;
  @override
  @HiveField(2)
  final String? lastName;
  @override
  @HiveField(3)
  final String email;
  @override
  @HiveField(4)
  final String? passwordHash;
  @override
  @HiveField(5)
  final String? passwordSalt;
  @override
  @HiveField(6)
  final DateTime? createdDateTime;
  @override
  @HiveField(7)
  final DateTime? lastUpdatedDateTime;
  const UserAccountModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.passwordHash,
    required this.passwordSalt,
    required this.createdDateTime,
    required this.lastUpdatedDateTime,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          passwordHash: passwordHash,
          passwordSalt: passwordSalt,
          createdDateTime: createdDateTime,
          lastUpdatedDateTime: lastUpdatedDateTime,
        );

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
