import 'package:starter_project/src/features/blog/domain/domain.dart';

class TagModel extends Tag {
  const TagModel({
    required super.id,
    required super.label,
    required super.description,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      label: json['label'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        label,
        description,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'description': description,
    };
  }
}
