# README

# Weather Sweather :sunny: :umbrella: :cloud: :snowflake:
  Weather Sweather is an app for the final project for Turing School's Mod 3. The app is built based on the following scenario: You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.


## Learning Goals

- Expose an API that aggregates data from multiple external APIs

- Expose an API that requires an authentication token

- Expose an API for CRUD functionality

- Determine completion criteria based on the needs of other developers

- Research, select, and consume an API based on your needs as a developer

## Setup

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

Database Migration: Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db: {:drop, :create, :migrate}
```
## API keys needed
Visit
- https://developer.mapquest.com/documentation/geocoding-api/
- https://openweathermap.org/api/one-call-api
- https://unsplash.com/developers

Sign up for an API key from each provider and add this in application.yml

