part of 'blog_bloc.dart';

final class BlogCreated extends BlogState {}

final class BlogDeleted extends BlogState {
  final String message;
  const BlogDeleted(this.message);
}

final class BlogDeleteFailure extends BlogFailure {
  const BlogDeleteFailure(super.message);
}

final class BlogFailure extends BlogState {
  final String message;
  const BlogFailure(this.message);
}

class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogSaving extends BlogState {}

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

final class BlogSuccess extends BlogState {
  final List<Blog> blogs;
  const BlogSuccess(this.blogs);
}

final class BlogUpdated extends BlogState {}

// final class ViewBlog extends BlogSuccess {
final class ViewBlog extends BlogState {
  final Blog blog;
  const ViewBlog({required this.blog});
}

final class ViewBlogs extends BlogSuccess {
  @override
  final List<Blog> blogs;
  const ViewBlogs({required this.blogs}) : super(blogs);
}
