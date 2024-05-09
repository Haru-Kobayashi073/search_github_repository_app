import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryItem {
  const RepositoryItem({
    required this.id,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    required this.openIssuesCount,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);

  final int id;
  final String fullName;
  final String? description;
  final String htmlUrl;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
}
