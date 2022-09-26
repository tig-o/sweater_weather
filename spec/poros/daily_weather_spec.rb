require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes', :vcr do
    coordinates = MapFacade.get_latitude_longitude("miami,fl")
    response = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
    weather = Weather.new(response)
    daily_forecast = weather.daily_weather[0]

    expect(daily_forecast.sunset).to be_a(Time)
    expect(daily_forecast.date).to be_a(String)
    expect(daily_forecast.icon).to be_a(String)
    expect(daily_forecast.sunrise).to be_a(Time)
    expect(daily_forecast.max_temp).to be_a(Float)
    expect(daily_forecast.min_temp).to be_a(Float)
    expect(daily_forecast.conditions).to be_a(String)
    expect(daily_forecast).to be_an_instance_of(DailyWeather)
  end
end