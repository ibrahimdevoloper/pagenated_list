import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagenated_list/Models/post.dart';
import 'package:pagenated_list/Services/post_api_service.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostApiService _postApiService;
  List<Post> posts = [];

  PostsCubit() : super(PostsInitial()) {
    _postApiService = PostApiService.create();
    getPosts();
  }

  getPosts() {
    emit(PostsLoading());
    _postApiService.getPosts().then((value) {
      List list = value.body;
      list.forEach(
        (element) {
          posts.add(Post.fromJson(element));
        },
      );
      emit(PostsLoaded(posts));
    });
  }

  addPosts() {
    emit(PostsAdding());
    _postApiService.getPosts().then((value) {
      List list = value.body;
      list.forEach(
        (element) {
          posts.add(Post.fromJson(element));
        },
      );
      emit(PostsAdded(posts));
    });
  }
}
