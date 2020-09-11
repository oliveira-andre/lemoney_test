# Lemoney Challenge

### How to use

First of all, lets build. It can take some time then it is a good to take a :coffee:
```
docker-compose build --no-cache
```

Create and migrate database schema
```
docker-compose run --rm web_app bundle exec rails db:create db:migrate
```

last but not least run the server
```
docker-compose up
```

### running tests

rubocop
```shell
docker-compose run --rm web_app bundle exec rubocop -a
```

rspec
you gonna need a dotenv file example:
```
db_host=your_pg_host
db_user=your_pg_user
db_password=your_pg_password
```

actualy running rspec
```shell
bundle exec rspec
```
