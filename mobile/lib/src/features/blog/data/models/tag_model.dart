class TagModel{
  final int id;
  final String label;
  final String description;

  TagModel(this.id,this.label,this.description);

  Map<String,dynamic> toJson() =>{
    'id':id,
    'label':label,
    'description':description,
  };

  TagModel.fromJson(Map<String,dynamic> json):
        id=json['id'] as int,
        label=json['label'] as String,
        description=json['description'] as String
  ;


}