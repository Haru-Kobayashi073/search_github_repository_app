import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';

class TextFieldAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const TextFieldAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryController = useTextEditingController();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);
    final formKey = GlobalKey<FormState>();

    return AppBar(
      toolbarHeight: 88,
      titleSpacing: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            autovalidateMode: validateMode.value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '検索ワードを入力してください';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              prefixIcon: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
              hintText: 'どんなリポジトリをお探しですか？',
              fillColor: Theme.of(context).colorScheme.onInverseSurface,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide.none,
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            controller: queryController,
            onFieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                ref
                    .read(searchRepositoryViewModelProvider.notifier)
                    .search(query: value);
              } else {
                validateMode.value = AutovalidateMode.onUserInteraction;
              }
            },
          ),
        ),
      ),
    );
  }
}
