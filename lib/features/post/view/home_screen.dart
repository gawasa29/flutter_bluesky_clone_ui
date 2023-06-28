import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routePath = '/Home';
  @override
  Widget build(BuildContext context) {
    print('📱 build HomeScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            floating: true,
            snap: true,
            leading:
                IconButton(onPressed: () {}, icon: const Icon(Icons.reorder)),
            title: Text(
              'Bluesky',
              style: typography.titleLarge!.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5),
                child: DefaultTabController(
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
                )),
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
    );
  }
}

class EachPost extends StatelessWidget {
  const EachPost({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UserName',
                            style: typography.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@HandleName',
                            style: typography.bodySmall!
                                .copyWith(color: colors.onSecondary),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: typography.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Posts will appear here.',
                            style: typography.bodyLarge!.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  print('Tap Reply');
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.chat_bubble_outline),
                                    Text('0'),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('Tap Retweet');
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.repeat),
                                    Text('0'),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('Tap Like');
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.favorite_border),
                                    Text('0'),
                                  ],
                                ),
                              ),
                              PopupMenuButton<int>(
                                icon: const Icon(Icons.more_horiz),
                                position: PopupMenuPosition.under,
                                onSelected: print,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.g_translate),
                                          SizedBox(width: 5),
                                          Text('Translate...'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Icon(Icons.copy_rounded),
                                          SizedBox(width: 5),
                                          Text('Copy post text'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 2,
                                      child: Row(
                                        children: [
                                          Icon(Icons.reply),
                                          SizedBox(width: 5),
                                          Text('Share...'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem(
                                      value: 3,
                                      child: Row(
                                        children: [
                                          Icon(Icons.speaker_notes_off),
                                          SizedBox(width: 5),
                                          Text('Mute thread'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem(
                                      value: 4,
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete),
                                          SizedBox(width: 5),
                                          Text('Delete post'),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 28, left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            const Divider(thickness: 0.5),
          ],
        ));
  }
}
