import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/model/search_repository_response.dart';
import 'package:search_github_repository_app/utils/app_dio.dart';

part 'github_api_client.g.dart';

@Riverpod(keepAlive: true)
GitHubApiClient gitHubApiClient(GitHubApiClientRef ref) {
  return GitHubApiClient(
    ref.watch(appDioProvider),
    baseUrl: 'https://api.github.com',
  );
}

@RestApi()
abstract class GitHubApiClient {
  factory GitHubApiClient(Dio dio, {String? baseUrl}) = _GitHubApiClient;

  @GET('/search/repositories')
  Future<SearchRepositoryResponse> fetchSearchRepositories({
    @Header('accept') String? accept,
    @Query('q') required String query,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });
}
