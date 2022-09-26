require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  it 'returns forecasts', :vcr do
    coordinates = MapFacade.get_latitude_longitude("miami,fl")
    response = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])

    expect(response).to be_a(Hash)
    expect(response).to have_key(:daily)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:current)
  end
end