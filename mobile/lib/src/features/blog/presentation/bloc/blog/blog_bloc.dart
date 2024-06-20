import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/features/blog/data/models/models.dart';
import 'package:starter_project/src/features/blog/domain/domain.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final CreateBlogUseCase _createBlogUseCase;
  final UpdateBlogUseCase _updateBlogUseCase;

  BlogBloc({
    required UpdateBlogUseCase updateBlogUseCase,
    required CreateBlogUseCase createBlogUseCase,
  })  : _updateBlogUseCase = updateBlogUseCase,
        _createBlogUseCase = createBlogUseCase,
        super(BlogInitial()) {
    on<BlogEvent>((_, emit) => emit(BlogLoading()));
    on<CreateBlogEvent>(_onCreateBlog);
    on<UpdateBlogEvent>(_onUpdateBlog);
  }

  void _emitBlogSuccess(
    Blog blog,
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
      (user) => _emitBlogSuccess(user, emit),
    );
    return null;
  }

  FutureOr<void> _onUpdateBlog(
      UpdateBlogEvent event, Emitter<BlogState> emit) async {
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
      (user) => _emitBlogSuccess(user, emit),
    );
    return null;
  }
}
