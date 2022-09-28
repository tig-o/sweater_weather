# README

# Sweater Weather :sunny: :umbrella: :cloud: :snowflake:
  Sweater Weather is an app for the final project for Turing School's Mod 3. The app is built based on the following scenario: You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.


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

## Endpoints provided


#### Retrieve weather for a city:
`GET /api/v1/forecast?location=denver,co`

*Response*

```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-07 22:32:53 -0700",
                "sunrise": "2022-06-07 04:32:14 -0700",
                "sunset": "2022-06-07 19:25:42 -0700",
                "temperature": 58.6,
                "feels_like": 57.16,
                "humidity": 64,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "2022-06-07",
                    "sunrise": "2022-06-07 04:32:14 -0700",
                    "sunset": "2022-06-07 19:25:42 -0700",
                    "max_temp": 80.56,
                    "min_temp": 55.71,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2022-06-08",
                    "sunrise": "2022-06-08 04:32:01 -0700",
                    "sunset": "2022-06-08 19:26:16 -0700",
                    "max_temp": 81.36,
                    "min_temp": 55.85,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-09",
                    "sunrise": "2022-06-09 04:31:51 -0700",
                    "sunset": "2022-06-09 19:26:49 -0700",
                    "max_temp": 90.37,
                    "min_temp": 63.5,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-06-10",
                    "sunrise": "2022-06-10 04:31:42 -0700",
                    "sunset": "2022-06-10 19:27:21 -0700",
                    "max_temp": 91.92,
                    "min_temp": 63.21,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-11",
                    "sunrise": "2022-06-11 04:31:35 -0700",
                    "sunset": "2022-06-11 19:27:50 -0700",
                    "max_temp": 92.66,
                    "min_temp": 69.24,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "22:00:00",
                    "temperature": 59.65,
                    "conditions": "light rain",
                    "icon": "10n"
                },
                {
                    "time": "23:00:00",
                    "temperature": 58.6,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "00:00:00",
                    "temperature": 58.62,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "01:00:00",
                    "temperature": 57.88,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "02:00:00",
                    "temperature": 57.29,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "03:00:00",
                    "temperature": 56.52,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 55.85,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 56.12,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```


#### Register as a user:
``POST /api/v1/users``

Request body:
```json
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```


#### Sessions User Login:
``POST /api/v1/sessions``

*Response*
```json
{
    "data": {
      "type": "users",
      "id": "1",
      "attributes": {
          "email": "whatever@example.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
    }
}
```


#### Create Road Trip:
``POST /api/v1/road_trip``

*Response*
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "new york, ny",
            "end_city": "los angeles, ca",
            "travel_time": "40:16:00",
            "weather_at_eta": {
                "temperature": 91.33,
                "conditions": "few clouds"
            }
        }
    }
}
```

#### Background Image Selection, return the url of an appropriate background image for a location:
``GET /api/v1/backgrounds?location=denver,co``

*Response*
```json
{
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "location": "Denver Colorado",
            "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwzNjc3MTB8MHwxfHNlYXJjaHw1fHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NjQzNzIxNTA&ixlib=rb-1.2.1",
            "credit": {
                "source": "www.unsplash.com",
                "author": "dillydallying",
                "logo": "https://dillydally.myportfolio.com"
            }
        }
    }
}
```
