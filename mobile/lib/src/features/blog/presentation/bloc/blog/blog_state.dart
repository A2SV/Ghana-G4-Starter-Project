part of 'blog_bloc.dart';

final class BlogDeleted extends BlogState {
  final String message;
  const BlogDeleted(this.message);
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
  final Blog blog;
  const BlogSuccess(this.blog);
}