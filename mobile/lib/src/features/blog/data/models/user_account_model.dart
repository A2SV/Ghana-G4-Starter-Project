class UserAccountModel{
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String createdDateTime;

  UserAccountModel(this.id,this.firstName, this.lastName, this.email, this.createdDateTime);
  Map<String,dynamic> toJson() =>{
    'id':id,
    'firstName':firstName,
    'lastName':lastName,
    'email':email,
    'createdDateTime':createdDateTime
  };

  UserAccountModel.fromJson(Map<String,dynamic> json):
        id=json['id'] as int,
        firstName=json['firstName'] as String,
        lastName=json['lastName'] as String,
        email=json['email'] as String,
        createdDateTime=json['createdDateTime'] as String
  ;
}