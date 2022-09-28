require 'rails_helper'

RSpec.describe 'Image API' do
  it 'retrieves a background image based on city', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to have_key(:data)
    expect(image[:data]).to be_a(Hash)
    expect(image[:data][:id]).to be nil
    expect(image[:data]).to have_key(:id)
    expect(image[:data]).to have_key(:type)
    expect(image[:data][:type]).to be_a(String)
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes]).to be_a(Hash)

    expect(image[:data][:attributes]).to have_key(:credit)
    expect(image[:data][:attributes]).to have_key(:location)
    expect(image[:data][:attributes][:credit]).to be_a(Hash)
    expect(image[:data][:attributes]).to have_key(:image_url)
    expect(image[:data][:attributes][:image_url]).to be_a(String)

    expect(image[:data][:attributes][:credit]).to have_key(:logo)
    expect(image[:data][:attributes][:credit]).to have_key(:source)
    expect(image[:data][:attributes][:credit]).to have_key(:author)
    expect(image[:data][:attributes][:credit][:logo]).to be_a(String)
    expect(image[:data][:attributes][:credit][:author]).to be_a(String)
    expect(image[:data][:attributes][:credit][:source]).to be_a(String)
  end
end