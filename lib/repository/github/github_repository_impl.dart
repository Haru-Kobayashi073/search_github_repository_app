import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/search_repository_response.dart';
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
  Future<SearchRepositoryResponse> searchRepositories({
    required String query,
    int? page,
  }) async {
    final response = await _client.searchRepositories(
      accept: 'application/vnd.github+json',
      page: page,
      query: query,
    );
    return response;
  }
}
