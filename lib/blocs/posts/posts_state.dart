part of 'posts_cubit.dart';

@immutable
abstract class PostsState {
  PostsState();
}

class PostsInitial extends PostsState {
  PostsInitial();
}

class PostsLoading extends PostsState {
  PostsLoading();
}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}

class PostsAdding extends PostsState {
  PostsAdding();
}

class PostsAdded extends PostsState {
  final List<Post> posts;
  PostsAdded(this.posts);
}
