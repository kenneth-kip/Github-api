[![Coverage Status](https://coveralls.io/repos/github/kenneth-kip/Github-api/badge.svg)](https://coveralls.io/github/kenneth-kip/Github-api)

[![Build Status](https://travis-ci.org/kenneth-kip/Github-api.svg?branch=master)](https://travis-ci.org/kenneth-kip/Github-api)

# GITHUB PROFILE VIEWER

This is an app that consumes the github API. It fetches a list of users and their profile.

## Installation

- Make sure you have Ruby 2.4.1 and Rails installed on your machine

- Create an Oauth app on github. Get the cient id and secret.

- Be careful store the client id and secret. Store them as env variables

- Create and run migrations. `rake db:create` and `rake db:migrate`

- After this, you are good to go, Just do `rails s` to start the app

## Deployment

- Hosted on heroku `http;//github-api-kenneth@herokuapp.com`

## Tests

- The github api is mocked using webmock and sinatra

- Run `rspec -f doc` to run the test



