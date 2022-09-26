require 'rails_helper'

RSpec.describe 'Retrieve Books API' do
  it 'sends books based on location and quantity and returns weather info' do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful
    binding.pry
    # expect(response.status).to eq(200)

    # expect(response).to have_key(:data)
    # expect(response[:data]).to be_a(Hash)
    # JSON.parse(response.body, symbolize_names: true)

  end
end