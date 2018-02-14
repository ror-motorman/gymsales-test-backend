# Gymsales test backend

## Deploy

```
git push heroku master
heroku run rake db:migrate
```

## Tests

```
rake db:test:prepare
rspec
```
