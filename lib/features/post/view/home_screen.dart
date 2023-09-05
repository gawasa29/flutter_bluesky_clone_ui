import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/widgets/each_post.dart';
import 'package:flutter_bluesky_clone/router/scaffold_with_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const routePath = '/Home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build HomeScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final scrollController = ScrollController();
    var lastScrollOffset = 0.0;
    scrollController.addListener(() {
      if (scrollController.offset > lastScrollOffset) {
        ref.watch(isVisibleProvider.notifier).update((state) => false);
      } else if (scrollController.offset < lastScrollOffset) {
        ref.watch(isVisibleProvider.notifier).update((state) => true);
      }
      lastScrollOffset = scrollController.offset;
    });
    return CustomScaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            floating: true,
            snap: true,
            title: Text(
              'Bluesky',
              style: typography.titleLarge!.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: HomeTabBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const EachPost();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ComposePostScreen.routePath);
        },
        shape: const CircleBorder(),
        backgroundColor: colors.primary,
        child: Icon(
          Icons.edit_square,
          color: colors.onPrimary,
        ),
      ),
    );
  }
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: [
              Text(
                'Following',
                style: typography.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Bluesky Team',
                style: typography.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "What's Hot",
                style: typography.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: colors.secondary,
          ),
        ],
      ),
    );
  }
}
