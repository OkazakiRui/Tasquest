## rails new

```
docker-compose run web rails new . --force --database=mysql --skip-bundle
```

## docker-compose build

```
docker-compose build
```

## config/database.yml

```
password: pass
host: db
```

## コンテナを起動

```
docker-compose up -d
```

## データベースを作成

```
docker-compose exec web rails db:create
```

## rails コマンド

```
docker-compose exec web bash
```

## コンテナの停止

```
docker-compose down
```
