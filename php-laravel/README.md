# Laravel開発用のDocker

## セットアップ

1. SSL接続に必要なキーを生成(httpsで接続する場合)
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

4. .envファイルを編集。DB_DATABASEは(2)に合わせる
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=dbname
DB_USERNAME=root
DB_PASSWORD=password

MAIL_HOST=mail
```

5. 表示確認
https://localhost
にアクセスしてLaravelの画面が表示されます。

## その他

.gitignoreは削除します。

node_modules,vendorディレクトリはマウントしていないので、追加したらホスト側にコピーします。
```shell-session
$ docker compose cp web:/var/www/html/node_modules ./html/
$ docker compose cp web:/var/www/html/vendor ./html/
```
シェルスクリプトにもしてあります。
```shell-session
$ ./scripts/vendor-cp.sh
```