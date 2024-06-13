import 'package:intl/intl.dart';
import 'package:starter_project/src/features/blog/domain/entities/tags.dart';
import 'package:starter_project/src/features/blog/domain/entities/user_account.dart';

class Blog{
  int? id;
  String? title;
  String? body;
  String? createdDateTime;
  String? lastUpdatedDateTime;
  UserAccount? userAccount;
  Tag? tags;




  Blog(int id, String title,String body, String createdDateTime,String lastUpdatedDateTime,UserAccount userAccount,Tag tags){
    this.id=id;
    this.title=title;
    this.body=body;
    this.createdDateTime=createdDateTime;
    this.lastUpdatedDateTime=lastUpdatedDateTime;
    this.userAccount=userAccount;
    this.tags=tags;
  }

  String convertDateToString(date){
    return DateFormat.yMMMd().format(date);
  }


}
