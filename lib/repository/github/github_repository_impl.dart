import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/repository_item.dart';
import 'package:search_github_repository_app/repository/github/github_api_client.dart';
import 'package:search_github_repository_app/repository/github/github_repository.dart';

part 'github_repository_impl.g.dart';

@Riverpod(keepAlive: true)
GitHubRepositoryImpl gitHubRepositoryImpl(GitHubRepositoryImplRef ref) {
  return GitHubRepositoryImpl(ref);
}

class GitHubRepositoryImpl implements GithubRepository {
  GitHubRepositoryImpl(
    Ref ref,
  ) : _client = ref.read(gitHubApiClientProvider);

  final GitHubApiClient _client;

  @override
  Future<List<RepositoryItem>> fetchRepositories({
    required String query,
  }) async {
    final response = await _client.fetchSearchRepositories(
      accept: 'application/vnd.github+json',
      query: query,
    );
    return response.items;
  }
}
