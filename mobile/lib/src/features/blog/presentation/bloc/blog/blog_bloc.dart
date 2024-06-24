import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/use_case/use_case.dart';
import 'package:starter_project/src/features/blog/data/models/tag_model_b.dart';
import 'package:starter_project/src/features/blog/domain/entities/blog_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/create_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/delete_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/update_blog_use_case_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_all_blogs_use_case.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_blog_use_case.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final CreateBlogUseCase _createBlogUseCase;
  final UpdateBlogUseCase _updateBlogUseCase;
  final DeleteBlogUseCase _deleteBlogUseCase;
  final ViewAllBlogUseCase _viewAllBlogUseCase;
  final ViewBlogUseCase _viewBlogUseCase;

  BlogBloc({
    required UpdateBlogUseCase updateBlogUseCase,
    required ViewAllBlogUseCase viewAllBlogUseCase,
    required DeleteBlogUseCase deleteBlogUseCase,
    required ViewBlogUseCase viewBlogUseCase,
    required CreateBlogUseCase createBlogUseCase,
  })  : _updateBlogUseCase = updateBlogUseCase,
        _createBlogUseCase = createBlogUseCase,
        _deleteBlogUseCase = deleteBlogUseCase,
        _viewAllBlogUseCase = viewAllBlogUseCase,
        _viewBlogUseCase = viewBlogUseCase,
        super(BlogInitial()) {
    on<BlogEvent>((_, emit) => emit(BlogLoading()));
    on<CreateBlogEvent>(_onCreateBlog);
    on<UpdateBlogEvent>(_onUpdateBlog);
    on<DeleteBlogEvent>(_onDeleteBlog);
    on<ViewAllBlogsEvent>(_onViewAllBlogs);
    on<ViewBlogEvent>(_onViewBlog);
  }

  void _emitBlogSuccess(
    List<Blog> blog,
    Emitter<BlogState> emit,
  ) {
    emit(BlogSuccess(blog));
  }

  FutureOr<void> _onCreateBlog(
      CreateBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _createBlogUseCase(
      CreateBlogParams(title: event.title, body: event.body, tags: event.tags),
    );

    res.fold(
      (failure) => emit(BlogFailure(failure.errorMessage)),
      (blog) => emit(BlogCreated()),
    );
    return null;
  }

  FutureOr<void> _onDeleteBlog(
      DeleteBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _deleteBlogUseCase(
      DeleteBlogParams(
        id: event.id,
      ),
    );

    res.fold(
      (failure) => emit(BlogDeleteFailure(failure.errorMessage)),
      (message) => emit(BlogDeleted(message)),
    );
    return null;
  }

  FutureOr<void> _onUpdateBlog(
      UpdateBlogEvent event, Emitter<BlogState> emit) async {
    emit(BlogSaving());
    final res = await _updateBlogUseCase(
      UpdateBlogParams(
        id: event.id,
        title: event.title,
        body: event.body,
        tags: event.tags,
      ),
    );

    res.fold(
      (failure) => emit(BlogFailure(failure.errorMessage)),
      (blog) => emit(BlogUpdated()),
    );
    return null;
  }

  FutureOr<void> _onViewAllBlogs(
      ViewAllBlogsEvent event, Emitter<BlogState> emit) async {
    final res = await _viewAllBlogUseCase(NoParams());
    res.fold(
      (failure) => emit(BlogFailure(failure.errorMessage)),
      (blogs) => _emitBlogSuccess(blogs, emit),
    );
    return null;
  }

  FutureOr<void> _onViewBlog(
      ViewBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _viewBlogUseCase(ViewBlogParams(id: event.id));
    res.fold(
      (failure) => emit(BlogFailure(failure.errorMessage)),
      (blog) => emit(ViewBlog(blog: blog)),
    );
    return null;
  }
}
