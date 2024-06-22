part of 'tag_bloc.dart';

final class TagFailure extends TagState {
  final String message;
  const TagFailure(this.message);
}

class TagInitial extends TagState {}

final class TagLoading extends BlogState {}


abstract class TagState extends Equatable {
  const TagState();

  @override
  List<Object> get props => [];
}
final class TagSuccess extends TagState {
  final Tag tag;
  const TagSuccess(this.tag);
}
