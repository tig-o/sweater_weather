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
end