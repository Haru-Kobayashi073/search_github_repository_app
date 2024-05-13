import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_github_repository_app/utils/gen/assets.gen.dart';

class SearchRepositoryEmptyResultView extends StatelessWidget {
  const SearchRepositoryEmptyResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.notFound,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const SizedBox(height: 16),
              const Text(
                '検索結果が見つかりませんでした',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
