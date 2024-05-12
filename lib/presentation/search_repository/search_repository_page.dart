import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/components/loading.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/repository_list_tile.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/text_field_app_bar.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';

class SearchRepositoryPage extends HookConsumerWidget {
  const SearchRepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchRepositoryViewModelProvider);

    return Scaffold(
      appBar: const TextFieldAppBar(),
      drawer: const Drawer(),
      body: switch (state) {
        SearchRepositoryLoading() => const Loading(),
        SearchRepositoryLoaded(items: final items) => NotificationListener(
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
                      child: Text('${state.totalResultCount}件の検索結果'),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      final item = items[index];
                      return RepositoryListTile(item: item);
                    },
                  ),
                  SliverToBoxAdapter(
                    child: state.isLoadingMore
                        ? const Loading()
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        SearchRepositoryError(error: final error) => Center(
            child: Text(error),
          ),
        SearchRepositoryEmptyList() => const Center(
            child: Text('Empty'),
          ),
      },
    );
  }
}
