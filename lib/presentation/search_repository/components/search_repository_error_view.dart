import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';
import 'package:search_github_repository_app/utils/gen/assets.gen.dart';

class SearchRepositoryErrorView extends ConsumerWidget {
  const SearchRepositoryErrorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.accessDenied,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const SizedBox(height: 16),
              const Text(
                'エラーが発生しました... \n ネットワークを確認してください',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: FilledButton.tonal(
                  onPressed: () =>
                      ref.invalidate(searchRepositoryViewModelProvider),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('再読み込み'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
