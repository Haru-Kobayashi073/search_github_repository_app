import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/repository/github/github_api_client.dart';
import 'package:search_github_repository_app/repository/github/github_repository.dart';

final githubRepositoryImplProvider = Provider<GitHubRepositoryImpl>(
  (ref) => GitHubRepositoryImpl(ref: ref),
);

class GitHubRepositoryImpl implements GithubRepository {
  const GitHubRepositoryImpl({required this.ref});

  final ProviderRef<GitHubRepositoryImpl> ref;

  GitHubApiClient get _apiClient => ref.watch(gitHubApiClientProvider);

  @override
  Future<List<RepositoryItem>> fetchRepositories({
    required String query,
  }) async {
    final response = await _apiClient.fetchSearchRepositories(
      accept: 'application/vnd.github+json',
      query: query,
    );
    return response.items;
  }
}
