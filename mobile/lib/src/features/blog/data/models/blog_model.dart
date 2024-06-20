import 'package:starter_project/src/features/blog/data/models/tag_model.dart';
import 'package:starter_project/src/features/blog/data/models/user_account_model.dart';

class BlogModel{
  final int id;
  final String title;
  final String body;
  final String createdDateTime;
  final UserAccountModel userAccount;
  final List<TagModel> tag;



  BlogModel(
      this.id,this.title, this.body, this.createdDateTime, this.userAccount, this.tag
      );


  Map<String,dynamic> toJson() =>{
    'id':id,
    'title':title,
    'body':body,
    'createdDateTime':createdDateTime,
    'userAccount':userAccount.toJson(),
    'tags': []

  };

  BlogModel.fromJson(Map<String,dynamic> json):
        id=json['id'] as int,
        title=json['title'] as String,
        body=json['body'] as String,
        createdDateTime=json['createdDateTime'] as String,
        userAccount=UserAccountModel.fromJson(json['userAccount']) as UserAccountModel,
        //tag=TagModel.fromJson(json['tags']) as List<TagModel>
        tag=convertTagList(json['tags'])

  ;
  

}


List<TagModel> convertTagList(List<dynamic> tags){
  List<TagModel> output=[];

  for (var tag in tags){
    output.add(TagModel.fromJson(tag));
  }

  return output;
}



