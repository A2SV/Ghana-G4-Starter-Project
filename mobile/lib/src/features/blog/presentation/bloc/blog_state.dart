import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class BlogState extends Equatable{
  @override
  List<Object> get props => [];
}

class IntialState extends BlogState{
  IntialState(){
    print('Initial state....');
  }
}

class LoadingState extends BlogState{
  LoadingState(){
    print('loading state....');
  }
}

class ViewBlogState extends BlogState{
  LoadingState(){
    print('Blog has been loaded');
  }
}