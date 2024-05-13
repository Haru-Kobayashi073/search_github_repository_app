import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_github_repository_app/model/repository_owner.dart';

part 'repository_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryItem {
  const RepositoryItem({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.owner,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);

  final int id;
  final String name;
  final String fullName;
  final String? description;
  final String htmlUrl;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
  final RepositoryOwner owner;
}
