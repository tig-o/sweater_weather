class ForecastSerializer
  def self.display_forecasts(weather_obj)
    {
      "data":
        {
          id: nil,
          type: "forecast",
          attributes: {
            current_weather: {
              datetime: weather_obj.datetime,
              sunrise: weather_obj.sunrise,
              sunset: weather_obj.sunset,
              temperature: weather_obj.temperature,
              feels_like: weather_obj.feels_like,
              humidity: weather_obj.humidity,
              uvi: weather_obj.uvi,
              visibility: weather_obj.visibility,
              conditions: weather_obj.conditions,
              icon: weather_obj.icon
            },
            daily_weather: weather_obj.daily_weather,
            hourly_weather: weather_obj.hourly_weather
          }
        }
    }
  end
end