import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_owner.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryOwner {
  const RepositoryOwner({
    required this.avatarUrl,
  });

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$RepositoryOwnerFromJson(json);

  final String avatarUrl;
}
