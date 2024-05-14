import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';
import 'package:search_github_repository_app/utils/gen/assets.gen.dart';

class SearchRepositoryFirstLaunchView extends StatelessWidget {
  const SearchRepositoryFirstLaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.searchPerson,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const SizedBox(height: 16),
            Text(
              t.searchRepository.letsSearch,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
