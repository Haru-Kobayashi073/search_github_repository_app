import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/repository/github/github_repository_impl.dart';
import 'package:search_github_repository_app/repository/language_colors/language_colors_repository_impl.dart';

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
    required this.languageColors,
    this.nextPageIndex = 2,
    this.isLoadingMore = false,
  });

  final String query;
  final String totalResultCount;
  final List<RepositoryItem> items;
  final Map<String, String> languageColors;
  final int nextPageIndex;
  final bool isLoadingMore;
}

class SearchRepositoryError extends SearchRepositoryViewModelState {
  const SearchRepositoryError(this.error);

  final String error;
}

class SearchRepositoryEmptyReuslt extends SearchRepositoryViewModelState {
  const SearchRepositoryEmptyReuslt();
}

class SearchRepositoryFirstLaunch extends SearchRepositoryViewModelState {
  const SearchRepositoryFirstLaunch();
}

@Riverpod(keepAlive: true)
class SearchRepositoryViewModel extends _$SearchRepositoryViewModel {
  @override
  SearchRepositoryViewModelState build() {
    return const SearchRepositoryFirstLaunch();
  }

  Future<void> search({required String query}) async {
    state = const SearchRepositoryLoading();
    try {
      final results = await ref
          .read(gitHubRepositoryImplProvider)
          .searchRepositories(query: query);

      if (results.items.isEmpty) {
        state = const SearchRepositoryEmptyReuslt();
        return;
      }
      final languageColors = await ref
          .read(languageColorsRepositoryImplProvider)
          .getLanguageColors();

      state = SearchRepositoryLoaded(
        query: query,
        items: results.items,
        languageColors: languageColors,
        totalResultCount: _addCommaToNum(results.totalCount),
      );
    } on Exception catch (e) {
      state = SearchRepositoryError(e.toString());
    }
  }

  void clear() {
    state = const SearchRepositoryFirstLaunch();
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
      languageColors: previousState.languageColors,
      nextPageIndex: previousState.nextPageIndex,
      isLoadingMore: true,
      totalResultCount: previousState.totalResultCount,
    );

    try {
      final moreResults =
          await ref.read(gitHubRepositoryImplProvider).searchRepositories(
                query: previousState.query,
                page: previousState.nextPageIndex,
              );

      if (moreResults.items.isNotEmpty) {
        state = SearchRepositoryLoaded(
          query: previousState.query,
          items: [...previousState.items, ...moreResults.items],
          languageColors: previousState.languageColors,
          nextPageIndex: previousState.nextPageIndex + 1,
          totalResultCount: previousState.totalResultCount,
        );
      }
    } on Exception catch (e) {
      state = SearchRepositoryError(e.toString());
    }
  }

  // 3桁ごとにカンマを追加する
  String _addCommaToNum(int num) {
    final formatter = NumberFormat('#,###');
    final numWithComma = formatter.format(num);
    return numWithComma;
  }
}
