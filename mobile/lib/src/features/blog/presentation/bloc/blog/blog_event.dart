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

final class DeleteBlogEvent extends BlogEvent {
  final int id;
  const DeleteBlogEvent({
    required this.id,
  });
}

final class UpdateBlogEvent extends BlogEvent {
  final String title;
  final String body;
  final List<TagModel> tags;
  final int id;
  const UpdateBlogEvent({
    required this.title,
    required this.body,
    required this.tags,
    required this.id,
  });
}

final class ViewAllBlogsEvent extends BlogEvent {
  const ViewAllBlogsEvent();
}

final class ViewBlogEvent extends BlogEvent {
  final int id;
  const ViewBlogEvent({
    required this.id,
  });
}

final class ViewTagsEvent extends BlogEvent {
  const ViewTagsEvent();
}
