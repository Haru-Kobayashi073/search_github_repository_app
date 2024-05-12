import 'package:search_github_repository_app/model/search_repository_response.dart';

// ignore: one_member_abstracts
abstract interface class GithubRepository {
  Future<SearchRepositoryResponse> searchRepositories({required String query});
}
