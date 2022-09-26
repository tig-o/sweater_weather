require 'rails_helper'

RSpec.describe 'Retrieve Books API' do
  it 'sends books based on location and quantity and returns weather info' do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful
    weather_books = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    
    # binding.pry
    expect(weather_books).to have_key(:data)
    expect(weather_books[:data]).to be_a(Hash)
    expect(weather_books[:data]).to have_key(:id)
    expect(weather_books[:data]).to have_key(:type)
    expect(weather_books[:data]).to have_key(:books)
    expect(weather_books[:data][:type]).to eq("books")
    expect(weather_books[:data][:books]).to be_an(Array)
    expect(weather_books[:data]).to have_key(:attributes)
    expect(weather_books[:data][:attributes]).to be_a(Hash)
    expect(weather_books[:data]).to have_key(:total_books_found)
    expect(weather_books[:data][:total_books_found]).to be_an(Integer)


    expect(weather_books[:data][:attributes]).to have_key(:forecast)
    expect(weather_books[:data][:attributes][:forecast]).to be_a(Hash)
    expect(weather_books[:data][:attributes]).to have_key(:destination)
    expect(weather_books[:data][:attributes][:destination]).to eq("denver,co")

    expect()
  end
end