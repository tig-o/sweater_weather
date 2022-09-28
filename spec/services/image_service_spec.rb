require 'rails_helper'

RSpec.describe 'ImageService' do
  it 'returns image data' do
    response = ImageService.get_image("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:total)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first[:id]).to be_a(String)
    expect(response[:results].first[:urls][:raw]).to be_a(String)
    expect(response[:results].first[:urls][:full]).to be_a(String)
    expect(response[:results].first[:urls][:regular]).to be_a(String)
    expect(response[:results].first[:user][:name]).to be_a(String)
    expect(response[:results].first[:user][:location]).to be_a(String)
    expect(response[:results].first[:user][:portfolio_url]).to be_a(String)
  end
end