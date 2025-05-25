# google_maps_flutter_improved

Flutter の GoogleMap Widget において、POI(Point Of Interest お店や特長的な場所)をクリックしたときの callback をカスタマイズできるようにしたもの

## 元リポジトリ（ディレクトリ）

https://github.com/flutter/packages/tree/main/packages/google_maps_flutter/

Commit: https://github.com/flutter/packages/commit/5a7d40f877274916bdd81ba18a6b508e2d266aa3

## 対応 Platform

Web のみ(Android/iOS にも対応できるよう修正可能と思う)

## 使い方

pubspec.yaml に以下を追加

```yaml:pubspec.yaml
dependencies:
  google_maps_flutter:
    git:
      url: https://github.com/dko5ki23t/google_maps_flutter_improved.git
      path: google_maps_flutter
      ref: main

dependency_overrides:
  google_maps_flutter_web:
    git:
      url: https://github.com/dko5ki23t/google_maps_flutter_improved.git
      path: google_maps_flutter_web
      ref: main

  google_maps_flutter_platform_interface:
    git:
      url: https://github.com/dko5ki23t/google_maps_flutter_improved.git
      path: google_maps_flutter_platform_interface
      ref: main
```

GoogleMap Widget のコンストラクタに`onPointOfInterestTap`を指定

```dart
GoogleMap(
    ...
    onPointOfInterestTap: (placeId) {
        log('POIタップ');
    },
    ...
)
```

## 参考

stackoverflow: https://stackoverflow.com/questions/78815338/google-maps-for-flutter-not-displaying-points-of-interest

issue: https://github.com/flutter/flutter/issues/60695

-> https://github.com/flutter/flutter/issues/60695#issuecomment-2136454702

repo: https://github.com/flutter/packages/tree/main/packages/google_maps_flutter

### 元リポジトリからサブディレクトリ以下を clone(?)する方法

Gemini の回答丸写し ↓

**手順の概要**:

1. 元のリポジトリをクローンする:

   ```bash
   git clone https://github.com/元のユーザー名/元のリポジトリ名.git
   cd 元のリポジトリ名
   ```

1. git filter-repo をインストールする:

   通常、Python の pip でインストールできます。

   ```Bash
   pip install git-filter-repo
   ```

1. 目的のパッケージを抽出する:

   packages/your_package_name のように、モノレポ内のパッケージのパスを指定します。

   ```Bash
   git filter-repo --subdirectory-filter packages/your_package_name --prune-empty auto
   ```

   - --subdirectory-filter: 指定したサブディレクトリを新しいリポジトリのルートにします。
   - --prune-empty auto: サブディレクトリに関係のないコミットを自動的に削除します。

1. リモートリポジトリを削除する:
   元のリポジトリへの参照を削除します。

   ```Bash
   git remote rm origin
   ```

1. 新しい GitHub リポジトリを作成する:
   GitHub 上で新しい空のリポジトリを作成します。例えば、my_custom_your_package_name のような名前にします。

1. 新しいリポジトリにプッシュする:
   新しい GitHub リポジトリの URL をリモートとして追加し、プッシュします。

   ```Bash
   git remote add origin https://github.com/あなたのユーザー名/my_custom_your_package_name.git
   git branch -M main # デフォルトブランチが main でない場合は適宜変更
   git push -u origin main
   ```

これで、特定のパッケージだけをフォークした形になり、独立したリポジトリとして修正・管理できるようになります。

**_プロジェクトでの利用方法_**:

あなたの Flutter プロジェクトの pubspec.yaml で、この新しいカスタムパッケージを git 依存関係として指定します。

```YAML
dependencies:
your_package_name:
git:
url: https://github.com/あなたのユーザー名/my_custom_your_package_name.git
ref: main # または修正したブランチ名
```

**_注意点_**:

- 履歴の書き換え: git filter-repo は履歴を書き換えます。これは新しいリポジトリでは問題ありませんが、元のリポジトリと完全に同期することはできなくなります。
- 元の変更を取り込む場合: 元のリポジトリで対象パッケージに更新があった場合、それらを自分のフォークに取り込むのは少し複雑になります。元のリポジトリを別のリモートとして追加し、手動でマージするか、再度 filter-repo を適用して変更を抽出し、それをマージするなどの作業が必要になる可能性があります。
