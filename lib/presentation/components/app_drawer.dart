import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';
import 'package:search_github_repository_app/utils/locale_service.dart';
import 'package:search_github_repository_app/utils/theme_service.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Drawer(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text(t.drawer.theme.title),
            childrenPadding: const EdgeInsets.only(left: 40),
            shape: const Border(),
            leading: switch (ref.watch(themeServiceProvider)) {
              ThemeMode.system ||
              ThemeMode.light =>
                const Icon(Icons.light_mode),
              ThemeMode.dark => const Icon(Icons.dark_mode),
            },
            children: [
              RadioListTile(
                title: Text(t.drawer.theme.system),
                groupValue: ref.watch(themeServiceProvider),
                value: ThemeMode.system,
                onChanged: (value) => ref
                    .read(themeServiceProvider.notifier)
                    .toggle(ThemeMode.system),
              ),
              RadioListTile(
                title: Text(t.drawer.theme.light),
                groupValue: ref.watch(themeServiceProvider),
                value: ThemeMode.light,
                onChanged: (value) => ref
                    .read(themeServiceProvider.notifier)
                    .toggle(ThemeMode.light),
              ),
              RadioListTile(
                title: Text(t.drawer.theme.dark),
                groupValue: ref.watch(themeServiceProvider),
                value: ThemeMode.dark,
                onChanged: (value) => ref
                    .read(themeServiceProvider.notifier)
                    .toggle(ThemeMode.dark),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(t.drawer.language.title),
            childrenPadding: const EdgeInsets.only(left: 40),
            shape: const Border(),
            leading: const Icon(Icons.language),
            children: [
              RadioListTile(
                title: Text(t.drawer.language.ja),
                groupValue: ref.watch(localeServiceProvider),
                value: AppLocale.ja,
                onChanged: (value) => ref
                    .read(localeServiceProvider.notifier)
                    .changeLocale(AppLocale.ja),
              ),
              RadioListTile(
                title: Text(t.drawer.language.en),
                groupValue: ref.watch(localeServiceProvider),
                value: AppLocale.en,
                onChanged: (value) => ref
                    .read(localeServiceProvider.notifier)
                    .changeLocale(AppLocale.en),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
