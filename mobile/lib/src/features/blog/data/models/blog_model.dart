import 'package:starter_project/src/features/blog/data/models/tag_model.dart';
import 'package:starter_project/src/features/blog/data/models/user_account_model.dart';

class BlogModel{
  final int id;
  final String title;
  final String body;
  final String createdDateTime;
  final String lastUpdatedDateTime;
  final UserAccountModel userAccount;
  final TagModel tag;



  BlogModel(
      this.id,this.title, this.body, this.createdDateTime, this.lastUpdatedDateTime, this.userAccount, this.tag
      );


  Map<String,dynamic> toJson() =>{
    'id':id,
    'title':title,
    'body':body,
    'createdDateTime':createdDateTime,
    'lastUpdatedDateTime':lastUpdatedDateTime,
    'userAccount':userAccount.toJson(),
    'tags':tag.toJson()

  };

  BlogModel.fromJson(Map<String,dynamic> json):
        id=json['id'] as int,
        title=json['title'] as String,
        body=json['body'] as String,
        createdDateTime=json['createdDateTime'] as String,
        lastUpdatedDateTime=json['lastUpdatedDateTime'] as String,
        userAccount=UserAccountModel.fromJson(json['userAccount']) as UserAccountModel,
        tag=TagModel.fromJson(json['tags']) as TagModel

  ;
}



