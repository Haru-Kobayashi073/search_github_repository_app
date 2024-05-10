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
  const SearchRepositoryLoaded(this.items);

  final List<RepositoryItem> items;
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
        .fetchRepositories(query: query);

    state = SearchRepositoryLoaded(results);
  }

  void clear() {
    state = const SearchRepositoryEmptyList();
  }

  void error(String message) {
    state = SearchRepositoryError(message);
  }
}
