part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

final class CreateBlogEvent extends BlogEvent {
  final String title;
  final String body;
  final List<TagModel> tags;
  const CreateBlogEvent({
    required this.title,
    required this.body,
    required this.tags,
  });
}

final class UpdateBlogEvent extends BlogEvent {
  final String title;
  final String body;
  final List<TagModel> tags;
  final String id;
  const UpdateBlogEvent({
    required this.title,
    required this.body,
    required this.tags,
    required this.id,
  });
}
