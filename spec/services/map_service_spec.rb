require 'rails_helper'

RSpec.describe 'MapService' do
  it 'retrieves longitude and latitude from a location', :vcr do
    response = MapService.get_latitude_longitude("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:lat)
    expect(response).to have_key(:lng)
    expect(response).to eq({:lat=>39.738453, :lng=>-104.984853})
  end

  it 'retrieves directions based on origin and destination', :vcr do
    response = MapService.get_roadtrip_directions('denver,co', 'pueblo,co')

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