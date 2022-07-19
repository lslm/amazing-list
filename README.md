# Amazing List

This is simply the funniest way to create and share tasks lists

> Rails version 7.0.3.1
> Ruby version 3.1.1

## Setup instructions
Amazing List uses Postgres to store data. To run the application locally, the following environment variables for the database credentials are needed:
```
export DB_USERNAME=<your database username>
export DB_PASSWORD=<your database password>
```

Then you must install the dependencies:
```
bundle install
rails db:create
rails db:migrate
```

### Running tests
```
rails test
```

### Running locally
```
bin/dev
```
