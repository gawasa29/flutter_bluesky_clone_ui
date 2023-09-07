import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:flutter_bluesky_clone/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

class PostRepository {
  PostRepository(this._bluesky);
  final Bluesky _bluesky;

  Future<void> createPostRepo({required String text}) async {
    await _bluesky.feeds.createPost(text: text);
  }

  Future<Feed> getFeed({String? cursor}) async {
    final response =
        await _bluesky.feeds.findTimeline(limit: 100, cursor: cursor);

    return response.data;
  }

  Future<PostThread> getFeeddd({required AtUri uri}) async {
    final response = await _bluesky.feeds.findPostThread(uri: uri);

    return response.data;
  }
}

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(BlueSkyApp.instance);
}

@riverpod
Future<List<FeedView>> fetchFeeds(FetchFeedsRef ref) async {
  final feeds = await ref.watch(postRepositoryProvider).getFeed();

  final feedViewList = feeds.feed;

  return feedViewList;
}

@riverpod
class Post extends _$Post {
  @override
  FutureOr<void> build() {}

  Future<void> createPost({required String text}) async {
    state = await AsyncValue.guard(() async {
      await ref.read(postRepositoryProvider).createPostRepo(text: text);
    });
    if (state.hasError == false) {
      ref.read(routerProvider).pop();
    }
  }
}
