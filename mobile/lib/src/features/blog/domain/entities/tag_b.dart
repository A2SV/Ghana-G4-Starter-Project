import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final int? id;
  final String label;
  final String description;

  const Tag({
    required this.id,
    required this.label,
    required this.description,
  });

  @override
  List<Object?> get props => [id, label, description];
}