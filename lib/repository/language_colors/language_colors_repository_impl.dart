import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/repository/language_colors/language_colors_repository.dart';
import 'package:search_github_repository_app/utils/app_dio.dart';

part 'language_colors_repository_impl.g.dart';

@Riverpod(keepAlive: true)
LanguageColorsRepositoryImpl languageColorsRepositoryImpl(
  LanguageColorsRepositoryImplRef ref,
) {
  return LanguageColorsRepositoryImpl(ref);
}

class LanguageColorsRepositoryImpl implements LanguageColorsRepository {
  LanguageColorsRepositoryImpl(
    Ref ref,
  ) : _dio = ref.read(appDioProvider);

  final Dio _dio;
  @override
  Future<Map<String, String>> getLanguageColors() async {
    final result = <String, String>{};
    final response = await _dio.get<String>(
      'https://raw.githubusercontent.com/ozh/github-colors/master/colors.json',
    );

    if (response.data is String) {
      final Map() = json.decode(response.data!) as Map<String, dynamic>
        ..forEach((key, value) {
          if (value is Map<String, dynamic>) {
            final color = value['color'].toString();
            result[key] = color;
          }
        });
    }
    return result;
  }
}
