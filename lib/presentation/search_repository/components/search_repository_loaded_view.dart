import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';
import 'package:search_github_repository_app/presentation/components/loading.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/repository_list_tile.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';

class SearchRepositoryLoadedView extends ConsumerWidget {
  const SearchRepositoryLoadedView({super.key, required this.state});
  final SearchRepositoryLoaded state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = state.items;
    final t = Translations.of(context);

    return NotificationListener(
      onNotification: (ScrollEndNotification n) {
        if (n.metrics.extentAfter == 0) {
          ref.read(searchRepositoryViewModelProvider.notifier).loadMore();
        }
        return true;
      },
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  t.searchRepository.foundCount(count: state.totalResultCount),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                final languageColor = state.languageColors[item.language];
                return RepositoryListTile(
                  item: item,
                  languageColor: languageColor != null
                      ? Color(
                          int.parse(languageColor.replaceAll('#', '0xff')),
                        )
                      : null,
                );
              },
            ),
            SliverToBoxAdapter(
              child: state.isLoadingMore ? const Loading() : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
