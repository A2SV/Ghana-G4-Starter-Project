import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String passwordHash;
  final String passwordSalt;
  final DateTime? createdDateTime;
  final DateTime? lastUpdatedDateTime;

  const UserAccount({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.passwordHash,
    required this.passwordSalt,
    required this.createdDateTime,
    required this.lastUpdatedDateTime,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        passwordHash,
        passwordSalt,
        createdDateTime,
        lastUpdatedDateTime,
      ];
}
