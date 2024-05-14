/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 38 (19 per locale)
///
/// Built on 2024-05-14 at 07:42 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsDrawerEn drawer = _StringsDrawerEn._(_root);
	late final _StringsAppBarEn appBar = _StringsAppBarEn._(_root);
	late final _StringsSearchRepositoryEn searchRepository = _StringsSearchRepositoryEn._(_root);
}

// Path: drawer
class _StringsDrawerEn {
	_StringsDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsDrawerThemeEn theme = _StringsDrawerThemeEn._(_root);
	late final _StringsDrawerLanguageEn language = _StringsDrawerLanguageEn._(_root);
}

// Path: appBar
class _StringsAppBarEn {
	_StringsAppBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get validatorNullCheck => 'Please enter search words';
	String get hintText => 'What repository are you looking for?';
}

// Path: searchRepository
class _StringsSearchRepositoryEn {
	_StringsSearchRepositoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSearchRepositoryDetailEn detail = _StringsSearchRepositoryDetailEn._(_root);
	String get empty => 'Repository could not be found';
	String get error => 'An error has occurred...  \n Please check your network';
	String get reload => 'reload';
	String get letsSearch => 'Let\'s explore the repository!';
	String foundCount({required Object count}) => '${count} search results';
}

// Path: drawer.theme
class _StringsDrawerThemeEn {
	_StringsDrawerThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'theme';
	String get system => 'system';
	String get light => 'light';
	String get dark => 'dark';
}

// Path: drawer.language
class _StringsDrawerLanguageEn {
	_StringsDrawerLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'language';
	String get ja => 'Japanese';
	String get en => 'English';
}

// Path: searchRepository.detail
class _StringsSearchRepositoryDetailEn {
	_StringsSearchRepositoryDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String star({required Object star}) => '${star} start';
	String fork({required Object fork}) => '${fork} fork';
	String watch({required Object watch}) => '${watch} watch';
	String issue({required Object issue}) => '${issue} open issue';
	String get languageEmpty => 'No language';
}

// Path: <root>
class _StringsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsDrawerJa drawer = _StringsDrawerJa._(_root);
	@override late final _StringsAppBarJa appBar = _StringsAppBarJa._(_root);
	@override late final _StringsSearchRepositoryJa searchRepository = _StringsSearchRepositoryJa._(_root);
}

// Path: drawer
class _StringsDrawerJa implements _StringsDrawerEn {
	_StringsDrawerJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsDrawerThemeJa theme = _StringsDrawerThemeJa._(_root);
	@override late final _StringsDrawerLanguageJa language = _StringsDrawerLanguageJa._(_root);
}

// Path: appBar
class _StringsAppBarJa implements _StringsAppBarEn {
	_StringsAppBarJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get validatorNullCheck => '検索ワードを入力してください';
	@override String get hintText => 'どんなリポジトリをお探しですか？';
}

// Path: searchRepository
class _StringsSearchRepositoryJa implements _StringsSearchRepositoryEn {
	_StringsSearchRepositoryJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsSearchRepositoryDetailJa detail = _StringsSearchRepositoryDetailJa._(_root);
	@override String get empty => 'リポジトリが見つかりませんでした';
	@override String get error => 'エラーが発生しました... \n ネットワークを確認してください';
	@override String get reload => '再読み込み';
	@override String get letsSearch => 'リポジトリを探索してみよう';
	@override String foundCount({required Object count}) => '${count} 件の検索結果';
}

// Path: drawer.theme
class _StringsDrawerThemeJa implements _StringsDrawerThemeEn {
	_StringsDrawerThemeJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テーマ';
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
}

// Path: drawer.language
class _StringsDrawerLanguageJa implements _StringsDrawerLanguageEn {
	_StringsDrawerLanguageJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '言語';
	@override String get ja => '日本語';
	@override String get en => '英語';
}

// Path: searchRepository.detail
class _StringsSearchRepositoryDetailJa implements _StringsSearchRepositoryDetailEn {
	_StringsSearchRepositoryDetailJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String star({required Object star}) => '${star} スター';
	@override String fork({required Object fork}) => '${fork} フォーク';
	@override String watch({required Object watch}) => '${watch} ウォッチ';
	@override String issue({required Object issue}) => '${issue} オープン';
	@override String get languageEmpty => '言語なし';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.theme.title': return 'theme';
			case 'drawer.theme.system': return 'system';
			case 'drawer.theme.light': return 'light';
			case 'drawer.theme.dark': return 'dark';
			case 'drawer.language.title': return 'language';
			case 'drawer.language.ja': return 'Japanese';
			case 'drawer.language.en': return 'English';
			case 'appBar.validatorNullCheck': return 'Please enter search words';
			case 'appBar.hintText': return 'What repository are you looking for?';
			case 'searchRepository.detail.star': return ({required Object star}) => '${star} start';
			case 'searchRepository.detail.fork': return ({required Object fork}) => '${fork} fork';
			case 'searchRepository.detail.watch': return ({required Object watch}) => '${watch} watch';
			case 'searchRepository.detail.issue': return ({required Object issue}) => '${issue} open issue';
			case 'searchRepository.detail.languageEmpty': return 'No language';
			case 'searchRepository.empty': return 'Repository could not be found';
			case 'searchRepository.error': return 'An error has occurred...  \n Please check your network';
			case 'searchRepository.reload': return 'reload';
			case 'searchRepository.letsSearch': return 'Let\'s explore the repository!';
			case 'searchRepository.foundCount': return ({required Object count}) => '${count} search results';
			default: return null;
		}
	}
}

extension on _StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.theme.title': return 'テーマ';
			case 'drawer.theme.system': return 'システム';
			case 'drawer.theme.light': return 'ライト';
			case 'drawer.theme.dark': return 'ダーク';
			case 'drawer.language.title': return '言語';
			case 'drawer.language.ja': return '日本語';
			case 'drawer.language.en': return '英語';
			case 'appBar.validatorNullCheck': return '検索ワードを入力してください';
			case 'appBar.hintText': return 'どんなリポジトリをお探しですか？';
			case 'searchRepository.detail.star': return ({required Object star}) => '${star} スター';
			case 'searchRepository.detail.fork': return ({required Object fork}) => '${fork} フォーク';
			case 'searchRepository.detail.watch': return ({required Object watch}) => '${watch} ウォッチ';
			case 'searchRepository.detail.issue': return ({required Object issue}) => '${issue} オープン';
			case 'searchRepository.detail.languageEmpty': return '言語なし';
			case 'searchRepository.empty': return 'リポジトリが見つかりませんでした';
			case 'searchRepository.error': return 'エラーが発生しました... \n ネットワークを確認してください';
			case 'searchRepository.reload': return '再読み込み';
			case 'searchRepository.letsSearch': return 'リポジトリを探索してみよう';
			case 'searchRepository.foundCount': return ({required Object count}) => '${count} 件の検索結果';
			default: return null;
		}
	}
}
