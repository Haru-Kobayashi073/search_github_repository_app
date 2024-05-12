import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/repository/github/github_repository_impl.dart';

part 'search_repository_viewmodel.g.dart';

sealed class SearchRepositoryViewModelState {
  const SearchRepositoryViewModelState();
}

class SearchRepositoryLoading extends SearchRepositoryViewModelState {
  const SearchRepositoryLoading();
}

class SearchRepositoryLoaded extends SearchRepositoryViewModelState {
  const SearchRepositoryLoaded({
    required this.query,
    required this.totalResultCount,
    required this.items,
    this.nextPageIndex = 2,
    this.isLoadingMore = false,
  });

  final String query;
  final String totalResultCount;
  final List<RepositoryItem> items;
  final int nextPageIndex;
  final bool isLoadingMore;
}

class SearchRepositoryError extends SearchRepositoryViewModelState {
  const SearchRepositoryError(this.error);

  final String error;
}

class SearchRepositoryEmptyList extends SearchRepositoryViewModelState {
  const SearchRepositoryEmptyList();
}

@Riverpod(keepAlive: true)
class SearchRepositoryViewModel extends _$SearchRepositoryViewModel {
  @override
  SearchRepositoryViewModelState build() {
    return const SearchRepositoryEmptyList();
  }

  Future<void> search({required String query}) async {
    state = const SearchRepositoryLoading();
    final results = await ref
        .read(gitHubRepositoryImplProvider)
        .searchRepositories(query: query);

    state = SearchRepositoryLoaded(
      query: query,
      items: results.items,
      totalResultCount: _addCommaToNum(results.totalCount),
    );
  }

  void clear() {
    state = const SearchRepositoryEmptyList();
  }

  void error(String message) {
    state = SearchRepositoryError(message);
  }

  Future<void> loadMore() async {
    if (state is! SearchRepositoryLoaded ||
        (state as SearchRepositoryLoaded).isLoadingMore) {
      return Future.value();
    }

    final previousState = state as SearchRepositoryLoaded;

    state = SearchRepositoryLoaded(
      query: previousState.query,
      items: previousState.items,
      nextPageIndex: previousState.nextPageIndex,
      isLoadingMore: true,
      totalResultCount: previousState.totalResultCount,
    );

    final moreResults =
        await ref.read(gitHubRepositoryImplProvider).searchRepositories(
              query: previousState.query,
              page: previousState.nextPageIndex,
            );

    if (moreResults.items.isNotEmpty) {
      state = SearchRepositoryLoaded(
        query: previousState.query,
        items: [...previousState.items, ...moreResults.items],
        nextPageIndex: previousState.nextPageIndex + 1,
        totalResultCount: previousState.totalResultCount,
      );
    }
  }

  String _addCommaToNum(int num) {
    final formatter = NumberFormat('#,###');
    final numWithComma = formatter.format(num);
    return numWithComma;
  }
}
