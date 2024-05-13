import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/utils/theme_service.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ExpansionTile(
            title: const Text('テーマ'),
            childrenPadding: const EdgeInsets.only(left: 40),
            shape: const Border(),
            leading: switch (ref.watch(themeServiceProvider)) {
              ThemeMode.system ||
              ThemeMode.light =>
                const Icon(Icons.light_mode),
              ThemeMode.dark => const Icon(Icons.dark_mode),
            },
            children: ThemeInformation.values
                .map(
                  (theme) => RadioListTile(
                    title: Text(theme.title),
                    groupValue: ref.watch(themeServiceProvider),
                    value: theme.themeMode,
                    onChanged: (value) =>
                        ref.read(themeServiceProvider.notifier).toggle(theme),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
