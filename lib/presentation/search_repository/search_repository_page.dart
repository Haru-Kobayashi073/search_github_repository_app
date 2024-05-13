import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/components/loading.dart';
import 'package:search_github_repository_app/presentation/components/text_field_app_bar.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/search_repository_empty_result_view.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/search_repository_error_view.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/search_repository_first_launch_view.dart';
import 'package:search_github_repository_app/presentation/search_repository/components/search_repository_loaded_view.dart';
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
        SearchRepositoryFirstLaunch() =>
          const SearchRepositoryFirstLaunchView(),
        SearchRepositoryLoading() => const Loading(),
        SearchRepositoryLoaded() => SearchRepositoryLoadedView(state: state),
        SearchRepositoryError() => const SearchRepositoryErrorView(),
        SearchRepositoryEmptyReuslt() =>
          const SearchRepositoryEmptyResultView(),
      },
    );
  }
}
