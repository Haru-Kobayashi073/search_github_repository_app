// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRepositoryResponse _$SearchRepositoryResponseFromJson(
        Map<String, dynamic> json) =>
    SearchRepositoryResponse(
      totalCount: (json['total_count'] as num).toInt(),
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchRepositoryResponseToJson(
        SearchRepositoryResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
