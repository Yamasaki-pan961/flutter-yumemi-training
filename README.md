# ゆめみ　Flutter研修課題

テンプレートはこちら
- https://github.com/yumemi-inc/flutter-training-template

## 環境構築

1. fvmをインストールする

↓Mac OS
```bash
brew tap leoafarias/fvm
brew install fvm
```

2.  リポジトリをクローンする
```bash
git clone https://github.com/Yamasaki-pan961/flutter-yumemi-training.git
```

3. 作業ディレクトリを変更する
```bash
cd flutter-yumemi-training
```

4. fvmに指定されたバージョンのFlutterをインストールする
```bash
fvm use
```

5. 依存パッケージをインストールする
```
fvm flutter pub get
```

---
## アーキテクチャ
クリーンアーキテクチャの概念を基に作成しました。

[ARCHITECTURE.md](/docs/architecture/ARCHITECTURE.md)