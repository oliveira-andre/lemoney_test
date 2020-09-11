# Lemoney Challenge

### How to use

First of all, lets build. It can take some time then it is a good to take a :coffee:
```
docker-compose build
```

Create and migrate database schema
```
docker-compose run --rm web_app bundle exec rails db:create db:migrate
```

last but not least run the server
```
docker-compose up
```
