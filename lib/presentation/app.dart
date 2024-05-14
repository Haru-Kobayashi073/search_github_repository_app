import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_page.dart';
import 'package:search_github_repository_app/utils/locale_service.dart';
import 'package:search_github_repository_app/utils/theme_service.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeServiceProvider);

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeServiceProvider),
      locale: currentLocale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: const SearchRepositoryPage(),
    );
  }
}
