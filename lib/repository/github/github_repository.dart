import 'package:search_github_repository_app/model/repository_item.dart';

// ignore: one_member_abstracts
abstract interface class GithubRepository {
  Future<List<RepositoryItem>> fetchRepositories({required String query});
}
