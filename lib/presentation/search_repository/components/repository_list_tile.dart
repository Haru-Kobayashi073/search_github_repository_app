import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/model/repository_item.dart';

class RepositoryListTile extends ConsumerWidget {
  const RepositoryListTile({super.key, required this.item});
  final RepositoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
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
