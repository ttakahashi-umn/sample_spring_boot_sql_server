# Sample Spring Boot SQL Server Application

このプロジェクトは、Spring Boot 4.0.1、Java 25、SQL Server、SchemaSpyを統合したサンプルアプリケーションです。

## 技術スタック

- **Java**: 25
- **Spring Boot**: 4.0.1
- **ビルドツール**: Gradle
- **データベース**: Microsoft SQL Server 2022
- **ORM**: Spring Data JPA (Hibernate)
- **ドキュメント**: SchemaSpy

## 前提条件

- Docker および Docker Compose がインストールされていること
- (ローカル開発の場合) Java 25 がインストールされていること

## プロジェクト構成

```
.
├── Dockerfile                    # Spring Bootアプリケーション用Dockerfile
├── docker-compose.yml            # Docker Compose設定ファイル
├── build.gradle                  # Gradle ビルドファイル
├── settings.gradle               # Gradle 設定ファイル
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── DemoApplication.java     # メインアプリケーション
│   │   │   ├── HelloController.java     # REST コントローラー
│   │   │   ├── User.java                # ユーザーエンティティ
│   │   │   └── UserRepository.java      # JPA リポジトリ
│   │   └── resources/
│   │       └── application.yml          # アプリケーション設定
│   └── test/
│       └── java/com/example/demo/
│           └── DemoApplicationTests.java
```

## 使い方

### Docker Composeで実行

1. プロジェクトをクローンする:
```bash
git clone <repository-url>
cd sample_spring_boot_sql_server
```

2. Docker Composeでサービスを起動:
```bash
docker-compose up -d
```

これにより以下のサービスが起動します:
- **SQL Server**: ポート 1433
- **Spring Boot Application**: ポート 8080
- **SchemaSpy**: データベーススキーマのドキュメント生成

3. アプリケーションにアクセス:
```bash
curl http://localhost:8080/
```

4. SchemaSpy出力を確認:
```bash
# SchemaSpyコンテナが実行完了したら、以下のディレクトリに出力されます
open schemaspy-output/index.html
```

### ローカル開発

1. SQL Serverのみを起動:
```bash
docker-compose up -d sqlserver
```

2. アプリケーションをビルド:
```bash
./gradlew build
```

3. アプリケーションを実行:
```bash
./gradlew bootRun
```

### テストの実行

```bash
./gradlew test
```

## データベース接続情報

- **Host**: localhost
- **Port**: 1433
- **Database**: testdb
- **Username**: sa
- **Password**: YourStrong@Passw0rd

## API エンドポイント

- `GET /` - Hello メッセージを返す

## 環境変数

アプリケーションは以下の環境変数をサポートしています:

- `DB_HOST`: データベースホスト (デフォルト: localhost)
- `DB_PORT`: データベースポート (デフォルト: 1433)
- `DB_NAME`: データベース名 (デフォルト: testdb)
- `DB_USER`: データベースユーザー (デフォルト: sa)
- `DB_PASSWORD`: データベースパスワード (デフォルト: YourStrong@Passw0rd)

## クリーンアップ

すべてのコンテナとボリュームを削除:
```bash
docker-compose down -v
```

## ライセンス

このプロジェクトは MIT ライセンスの下で公開されています。