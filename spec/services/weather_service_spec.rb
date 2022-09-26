require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'retrieves weather forecasts', :vcr do
    coordinates = MapService.get_latitude_longitude("miami,fl")
    response = WeatherService.get_forecasts(coordinates[:lat], coordinates[:lng])

    expect(response).to be_a(Hash)
    expect(response).to have_key(:daily)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:current)
  end
end