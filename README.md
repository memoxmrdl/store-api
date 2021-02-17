# Store API

## System requirements

- Ruby 2.6.5
- Rails 6.1.2.1

## Dependencies

### Ruby

    bundle install

## Database

To setup database you either run:

    bin/rails db:setup

or

    bin/rails db:drop db:create db:migrate db:seed

### Running migrations

To run migrations use the following command:

    bin/rails db:migrate

## Test

You should run the tests with the following command:

    bin/rails test
