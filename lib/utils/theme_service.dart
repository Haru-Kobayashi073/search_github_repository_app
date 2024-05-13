import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_service.g.dart';

@Riverpod(keepAlive: true)
class ThemeService extends _$ThemeService {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void toggle(ThemeInformation theme) {
    state = theme.themeMode;
  }
}

enum ThemeInformation {
  system(title: 'システム', themeMode: ThemeMode.system),
  light(title: 'ライト', themeMode: ThemeMode.light),
  dark(title: 'ダーク', themeMode: ThemeMode.dark);

  const ThemeInformation({
    required this.title,
    required this.themeMode,
  });

  final String title;
  final ThemeMode themeMode;
}
