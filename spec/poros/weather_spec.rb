require 'rails_helper'

RSpec.describe Weather do
  it 'exists and has attributes', :vcr do
    coordinates = MapFacade.get_latitude_longitude("miami,fl")
    response = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
    weather = Weather.new(response)
    binding.pry
    expect(weather.id).to be nil
    expect(weather.uvi).to be_a(Float)
    expect(weather.icon).to be_a(String)
    expect(weather.sunset).to be_a(Time)
    expect(weather.sunrise).to be_a(Time)
    expect(weather.datetime).to be_a(Time)
    expect(weather.feels_like).to be_a(Float)
    expect(weather.temperature).to be_a(Float)
    expect(weather.humidity).to be_an(Integer)
    expect(weather.conditions).to be_a(String)
    expect(weather.visibility).to be_an(Integer)
    expect(weather).to be_an_instance_of(Weather)
  end
end