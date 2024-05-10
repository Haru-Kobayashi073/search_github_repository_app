import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';

class SearchRepositoryPage extends HookConsumerWidget {
  const SearchRepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchRepositoryViewModelProvider);
    final queryController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          autofocus: true,
          controller: queryController,
          onFieldSubmitted: (value) {
            ref
                .read(searchRepositoryViewModelProvider.notifier)
                .search(query: value);
          },
        ),
      ),
      body: switch (state) {
        SearchRepositoryLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        SearchRepositoryLoaded(items: final items) => CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item.fullName),
                    subtitle: Text(item.description ?? ''),
                  );
                },
              ),
            ],
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
