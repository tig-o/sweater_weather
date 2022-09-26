require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes', :vcr do
    coordinates = MapFacade.get_latitude_longitude("miami,fl")
    response = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
    weather = Weather.new(response)
    hourly_forecast = weather.hourly_weather[0]

    expect(hourly_forecast.time).to be_a(String)
    expect(hourly_forecast.icon).to be_a(String)
    expect(hourly_forecast.temperature).to be_a(Float)
    expect(hourly_forecast.conditions).to be_a(String)
    expect(hourly_forecast).to be_an_instance_of(HourlyWeather)
  end
end