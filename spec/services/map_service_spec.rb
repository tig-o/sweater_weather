require 'rails_helper'

RSpec.describe 'MapService' do
  it 'retrieves longitude and latitude from a location', :vcr do
    response = MapService.get_latitude_longitude("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:lat)
    expect(response).to have_key(:lng)
    expect(response).to eq({:lat=>39.738453, :lng=>-104.984853})
  end
end