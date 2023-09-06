// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postRepositoryHash() => r'814cd05000adeb6fa62f92c2939f82b7de30054f';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = AutoDisposeProvider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRepositoryRef = AutoDisposeProviderRef<PostRepository>;
String _$fetchFeedsHash() => r'c3619334a197315a0da78558b8dcdaa641b8b3de';

/// See also [fetchFeeds].
@ProviderFor(fetchFeeds)
final fetchFeedsProvider = AutoDisposeFutureProvider<List<FeedView>>.internal(
  fetchFeeds,
  name: r'fetchFeedsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchFeedsRef = AutoDisposeFutureProviderRef<List<FeedView>>;
String _$postHash() => r'c5d811c8563e189d31c5c89b579fda323a6886be';

/// See also [Post].
@ProviderFor(Post)
final postProvider = AutoDisposeAsyncNotifierProvider<Post, void>.internal(
  Post.new,
  name: r'postProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Post = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
