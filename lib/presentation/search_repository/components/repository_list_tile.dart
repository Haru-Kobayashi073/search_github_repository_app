import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/presentation/repository_detail/repository_detail_page.dart';

class RepositoryListTile extends ConsumerWidget {
  const RepositoryListTile({
    super.key,
    required this.item,
    required this.languageColor,
  });
  final RepositoryItem item;
  final Color? languageColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) =>
                RepositoryDetailPage(item: item, languageColor: languageColor),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: CachedNetworkImageProvider(item.owner.avatarUrl),
      ),
      title: Text(
        item.fullName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item.description ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
