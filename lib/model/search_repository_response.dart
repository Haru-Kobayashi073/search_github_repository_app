import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_github_repository_app/model/repository_item.dart';

part 'search_repository_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchRepositoryResponse {
  const SearchRepositoryResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryResponseFromJson(json);

  final int totalCount;
  final bool incompleteResults;
  final List<RepositoryItem> items;
}
