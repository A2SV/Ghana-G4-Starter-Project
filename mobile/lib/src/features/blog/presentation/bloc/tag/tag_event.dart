part of 'tag_bloc.dart';

abstract class TagEvent extends Equatable {
  const TagEvent();

  @override
  List<Object> get props => [];
}

final class ViewTagsEvent extends TagEvent {
  const ViewTagsEvent();
}
