import 'package:equatable/equatable.dart';
import 'package:starter_project/src/core/entities/user_account.dart';

import 'entities.dart';

class Blog extends Equatable {
  final int? id;
  final String title;
  final String body;
  final DateTime? createdDateTime;
  final DateTime? lastUpdatedDateTime;
  final int userAccountId;
  final UserAccount userAccount;
  final List<Tag>? tags;

  const Blog({
    required this.id,
    required this.title,
    required this.body,
    required this.createdDateTime,
    required this.lastUpdatedDateTime,
    required this.userAccountId,
    required this.userAccount,
    this.tags,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        createdDateTime,
        lastUpdatedDateTime,
        userAccountId,
        userAccount,
        tags,
      ];
}
