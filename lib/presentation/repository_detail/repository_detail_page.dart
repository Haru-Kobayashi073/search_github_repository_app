import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/utils/gen/assets.gen.dart';

class RepositoryDetailPage extends HookConsumerWidget {
  const RepositoryDetailPage({
    super.key,
    required this.item,
    this.languageColor,
  });
  final RepositoryItem item;
  final Color? languageColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(item.owner.avatarUrl),
                ),
                const SizedBox(width: 8),
                Text(item.owner.login),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(item.description ?? ''),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: BorderSide.none,
                  avatar: const Icon(Icons.star_border_outlined),
                  label: Text('${item.stargazersCount}スター'),
                ),
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: BorderSide.none,
                  avatar: SvgPicture.asset(
                    Assets.icons.gitFork,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: Text('${item.forksCount}フォーク'),
                ),
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: BorderSide.none,
                  avatar: const Icon(Icons.remove_red_eye_outlined),
                  label: Text('${item.watchersCount}ウォッチ'),
                ),
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: BorderSide.none,
                  avatar: SvgPicture.asset(
                    Assets.icons.issueOpened,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: Text('${item.openIssuesCount}オープン'),
                ),
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  side: BorderSide.none,
                  avatar: languageColor != null
                      ? CircleAvatar(
                          radius: 8,
                          backgroundColor: languageColor,
                        )
                      : null,
                  label: Text(item.language ?? '言語なし'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
