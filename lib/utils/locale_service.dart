import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';

part 'locale_service.g.dart';

@Riverpod(keepAlive: true)
class LocaleService extends _$LocaleService {
  @override
  AppLocale build() {
    return LocaleSettings.currentLocale;
  }

  Future<void> changeLocale(AppLocale newLocale) async {
    state = newLocale;
    LocaleSettings.setLocale(newLocale);
  }
}
