import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_viewmodel.dart';

import 'provider_container_utils.dart';

void main() {
  late SearchRepositoryViewModel target;

  setUp(() {
    final container = createContainer();
    target = container.read(searchRepositoryViewModelProvider.notifier);
  });

  test('初期値のStateがSearchRepositoryFirstLaunchである', () {
    expect(target.state, isA<SearchRepositoryFirstLaunch>());
  });

  test('正しく検索結果を取得できる', () async {
    await target.search(query: 'Haru-Kobayashi073').then((value) {
      expect(target.state, isA<SearchRepositoryLoaded>());
    });
    expect(
      (target.state as SearchRepositoryLoaded).items.first.name,
      'Haru-Kobayashi073',
    );
  });

  test('loadMoreを行った時に、リスト内に30アイテムが追加されているか', () async {
    await target.search(query: 'dart');
    expect(
      (target.state as SearchRepositoryLoaded).items.length,
      30,
    );
    await target.loadMore();
    expect(
      (target.state as SearchRepositoryLoaded).items.length,
      60,
    );
  });

  test('検索結果が0件の場合、SearchRepositoryEmptyReusltが返却される', () async {
    await target.search(query: 'qscwdvefbrgnhjmk');
    expect(target.state, isA<SearchRepositoryEmptyReuslt>());
  });

  test(
    'clearを走らせたときにStateにSearchRepositoryEmptyResultが入るか',
    () async {
      await target.search(query: 'dart');
      expect(target.state, isA<SearchRepositoryLoaded>());
      target.clear();
      expect(target.state, isA<SearchRepositoryEmptyReuslt>());
    },
  );
}
