import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_github_repository_app/utils/gen/assets.gen.dart';

class SearchRepositoryFirstLaunchView extends StatelessWidget {
  const SearchRepositoryFirstLaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.undrawLandscapePhotographerBlv1,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const SizedBox(height: 16),
            const Text(
              'リポジトリを探索してみよう',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
