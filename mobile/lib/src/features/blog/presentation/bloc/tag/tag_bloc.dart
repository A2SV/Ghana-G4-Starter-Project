import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/src/core/use_case/use_case.dart';
import 'package:starter_project/src/features/blog/domain/entities/tag_b.dart';
import 'package:starter_project/src/features/blog/domain/use_cases/view_all_tags_use_case_b.dart';
import 'package:starter_project/src/features/blog/presentation/bloc/blog/blog_bloc.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final ViewTagsUseCase _viewTagsUseCase;

  TagBloc({
    required ViewTagsUseCase viewTagsUseCase,
  })  : _viewTagsUseCase = viewTagsUseCase,
        super(TagInitial()) {
    on<ViewTagsEvent>(_onViewTags);
  }

  void _emitTagSuccess(
    Tag tag,
    Emitter<TagState> emit,
  ) {
    emit(TagSuccess(tag));
  }

  FutureOr<void> _onViewTags(
      ViewTagsEvent event, Emitter<TagState> emit) async {
    final res = await _viewTagsUseCase(NoParams());
    res.fold(
      (failure) => emit(TagFailure(failure.errorMessage)),
      (tag) => _emitTagSuccess(tag[0], emit),
    );
    return null;
  }
}
