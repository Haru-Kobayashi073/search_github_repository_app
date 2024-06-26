## セットアップ

開発者の環境(参考)
```
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.19.6, on macOS 14.2 23C64 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 15.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] Android Studio (version 2022.3)
[✓] VS Code (version 1.88.1)
[✓] Connected device (4 available)
[✓] Network resources

• No issues found!
```

### 1. リポジトリをクローンする
```
git clone https://github.com/Haru-Kobayashi073/search_github_repository_app.git
```

### 2. fvmを使用して、バージョンを合わせる

```
fvm use 3.19.6
```


### 3. 実行

```
fvm flutter run
```

</br>
</br>
</br>

## フォルダ構成の説明
MVVM + Repositoryフォルダ構成です。

なぜこの構成にしたかというと、レイヤードアーキテクチャなどだと機能が重たすぎて今回の要件にはオーバースペックだと判断しました。
なので、実務でも触れているMVVMを活用しつつ、リポジトリパターンを取り入れました。

[参考](https://zenn.dev/alesion/articles/ab2df82a3809b7)


```
lib
├── i18n
│   │
│   │   // 多言語対応用のディレクトリ
│   └── // 今回は日本語と英語に対応
│
├── model
│   │
│   │
│   └── // Entity・APIのレスポンスの型を配置するディレクトリ
│
├── presentation
│   │
│   │　// UI(各画面や共通Widget)を記述したファイルとrepositoryとViewのブリッジになるViewModelを配置する
│   │
│   ├── components
│   │   │
│   │   │ // グローバルコンポーネントを配置
│   │   │
│   │   └── loading.dart
│   │
│   └── search_repository
│       │
│       ├── components
│       │　// ページごとでしか使用しないコンポーネントを配置
│       │
│       │
│       ├── search_repository_page.dart
│       │ // MVVMのView部分を配置
│       │
│       │
│       └── search_repository_viewmodel.dart
│         // MVVMのViewModel部分を配置
│
├── repository
│   │ // 関心ごとずつにディレクトリわけを行う
│   │
│   └── github
│       │
│       ├── github_repository_impl.dart
│       │  // リポジトリの具象クラスを記述
│       │
│       │
│       └── github_repository.dart
│          // リポジトリの抽象クラスを記述
│
│
├── utils
│   └── 主に重要なユーティリティクラスのインスタンスをProviderで配信
│
└── main.dart
```

## 自分の中での挑戦

- 今までインターンやアルバイトにて多言語対応はしてきましたが、最初から基盤を実装したのは初めてでした。
- テストに初めて挑戦し、UnitテストとIntegrationテストにチャレンジしました。思いの外楽しかったです🎉
- material design3を実現するためにAppBarをGmailっぽくしてみたことなど。
- Drawerの中身にテーマや言語切り替えのボタンがありますが、UXを意識して、専用のページに遷移するのではなく、その場の画面でプルダウンの選択肢が見えるようにした部分はシンプルに工夫できたなと思います。

## 今後行いたいこと
- TestFlightなどの仮のデプロイ環境へのCDなどまでできなかったので、取り組みたいです。
- GitHubの言語ごとの色を取得するロジックが少々無理矢理な書き方になってしまった部分をリファクタしたいです。

</br>
</br>
</br>
</br>

## 以下課題要件

# 株式会社ゆめみ Flutter エンジニアコードチェック課題

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に Flutter エンジニアを希望する方に出す課題用のプロジェクトです。 本課題が与えられた方は、以下を詳しく読んだ上で課題に取り組んでください。

## 概要

以下の要件を満たす、Android・iOS で動作するアプリを Flutter で作成してください。

## 要件

### 環境

- IDE・SDK・プログラミング言語については、基本的に最新の安定版を利用すること
- 最新の安定版以外を利用する場合は、理由も含めて README に記載すること
- 状態管理パッケージには Provider/Riverpod のいずれかを使うこと
- サードパーティーライブラリについては、オープンソースのものに限り制限しない

### 対象 OS バージョン

基本的に Flutter プロジェクト作成時のバージョンにすること

|         | OS Version |
|---------|------------|
| iOS     | 9.0 ~ 15.2 |
| Android | 4.1 ~ 12   |

※ 本プロジェクト更新時点

### 動作

- 何かしらのキーワードを入力できる
- 入力したキーワードで GitHub のリポジトリを検索できる
- GitHub のリポジトリを検索する際、GitHub API（[`search/repositories`](https://docs.github.com/ja/rest/reference/search#search-repositories)）を利用する
  - [github | Dart Package](https://pub.dev/packages/github) のようなパッケージは利用せず、API を呼ぶ処理を自分で実装すること
- 検索結果は一覧で概要（リポジトリ名）を表示する
- 検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する

### デザイン

マテリアルデザインに準拠すること

## 提出方法

- GitHub の public リポジトリの URL をお知らせください
- 別の方法で提出する場合はご相談ください（Git のコミット履歴が分かる形式が望ましいです）
- この課題とは別のコード(ご自身で公開されているOSS等)をもって課題の提出とすることをご希望の場合はご相談ください

## 評価ポイント

- レビューのしやすさ
  - README の充実
  - 適切なコメント
  - GitHub のプルリクエスト機能などの利用
- Git
  - 適切な gitignore の設定
  - 適切なコミット粒度
  - 適切なブランチ運用
- 簡潔性・可読性・安全性・保守性の高いコード
- Dart の言語機能を適切に使いこなせているか
- テスト
  - テストが導入しやすい構成
  - Unit・UI テストがある
- UI/UX
  - エラー発生時の処理
  - 画面回転・様々な画面サイズ対応
  - Theme の適切な利用・ダークモードの対応
  - 多言語対応
  - アニメーションなど
- CI/CD
  - ビルド
  - テスト
  - リント
  - フォーマット
  - 仮のデプロイ環境

上記以外でも高く評価できるポイントがあれば同等に考慮します。

アピールする点があれば、README に箇条書きなどで記載してください。

## 参考記事

評価ポイントについて詳しくまとめた記事がありますので、ぜひご覧ください。

- [私が（iOS エンジニアの）採用でコードチェックする時何を見ているのか](https://qiita.com/lovee/items/d76c68341ec3e7beb611)
- [ゆめみの Android の採用コーディング試験を公開しました](https://qiita.com/blendthink/items/aa70b8b3106fb4e3555f)

## AI サービスの利用について

ChatGPT等のAIサービスを利用することは、禁止しておりません。

利用にあたって工夫したプロンプトやソースコメント等をご提出頂くことで、加点評価する場合もあります。(減点評価はありません)

また、弊社コードチェック担当者もAIサービスを利用させていただく場合があります。
AIサービスの利用は差し控えてもらいたい等のご要望があれば、お気軽にお知らせください。

## Mac をお持ちでない場合について

Mac をお持ちでない場合は課題提出時にその旨お伝えください。
iOS に関連するコード、動作をレビュー対象から除外いたします。