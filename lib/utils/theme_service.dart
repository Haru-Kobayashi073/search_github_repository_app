import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_service.g.dart';

@Riverpod(keepAlive: true)
class ThemeService extends _$ThemeService {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  // ignore: use_setters_to_change_properties
  void toggle(ThemeMode theme) {
    state = theme;
  }
}
