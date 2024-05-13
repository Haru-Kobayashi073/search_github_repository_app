import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
