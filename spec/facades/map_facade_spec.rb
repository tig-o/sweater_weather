require 'rails_helper'

RSpec.describe 'MapFacade' do
  it 'returns lat and long', :vcr do
    coordinates = MapFacade.get_latitude_longitude("denver,co")

    expect(coordinates).to be_a(Hash)
    expect(coordinates.count).to eq(2)
    expect(coordinates).to have_key(:lat)
    expect(coordinates).to have_key(:lng)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
  end

  it 'retrieves directions based on origin and destination', :vcr do
    response = MapFacade.get_roadtrip_directions('denver,co', 'pueblo,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route][:formattedTime]).to be_a(String)
    expect(response[:route]).to have_key(:sessionId)
    expect(response[:route][:sessionId]).to be_a(String)
    expect(response[:route]).to have_key(:distance)
    expect(response[:route][:distance]).to be_a(Float)
  end
end