1. SSL接続に必要なキーを生成
```shell-session
$ ./scripts/make-sslkey.sh
```

2. 初期作成されるデータベースを変更する場合下記ファイルを編集
docker/mysql/init.sql
```sql
CREATE DATABASE IF NOT EXISTS `dbname`;
CREATE DATABASE IF NOT EXISTS `dbname_test`;
```

3. DockerのビルドとLaravelのインストール
```shell-session
$ ./scripts/setup.sh
```

4. .envファイルを編集。DB_DATABASEは2に合わせる
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=dbname
DB_USERNAME=root
DB_PASSWORD=password

MAIL_HOST=mail
```