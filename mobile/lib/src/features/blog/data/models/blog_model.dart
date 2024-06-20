import 'package:starter_project/src/features/auth/data/models/user_account_model.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

class BlogModel extends Blog {
  const BlogModel({
    required super.userAccount,
    required super.id,
    required super.title,
    required super.body,
    required super.createdDateTime,
    required super.lastUpdatedDateTime,
    required super.userAccountId,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      userAccount: UserAccountModel.fromJson(json['userAccount']),
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdDateTime: DateTime.parse(json['createdDateTime']),
      lastUpdatedDateTime: DateTime.parse(json['lastUpdatedDateTime']),
      userAccountId: json['userAccountId'],
    );
  }

  @override
  List<Object?> get props => [
        userAccount,
        id,
        title,
        body,
        createdDateTime,
        lastUpdatedDateTime,
        userAccountId,
      ];

  Map<String, dynamic> toJson() {
    return {
      'userAccount': userAccount,
      'id': id,
      'title': title,
      'body': body,
      'createdDateTime': createdDateTime!.toIso8601String(),
      'lastUpdatedDateTime': lastUpdatedDateTime!.toIso8601String(),
      'userAccountId': userAccountId,
    };
  }
}
