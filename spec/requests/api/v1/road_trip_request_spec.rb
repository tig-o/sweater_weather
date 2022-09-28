require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it 'returns travel time and arrival forecast based', :vcr do
    User.create!(
      email: "dude@turing.com", 
      password: "pw123", 
      password_confirmation: "pw123", 
      api_key: "1a25138ffaf6ab1d60d1d01cd0")

    request_data = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "1a25138ffaf6ab1d60d1d01cd0"
    }

    post '/api/v1/road_trip', params: request_data, as: :json
    expect(response.status).to eq(200)
    
    road_trip_data = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip_data).to be_a(Hash)
    expect(road_trip_data).to have_key(:data)
    expect(road_trip_data[:data]).to have_key(:id)
    expect(road_trip_data[:data]).to have_key(:type)
    expect(road_trip_data[:data][:type]).to eq("roadtrip")
    expect(road_trip_data[:data]).to have_key(:attributes)
    expect(road_trip_data[:data][:attributes]).to be_a(Hash)

    expect(road_trip_data[:data][:attributes]).to have_key(:start_city)
    expect(road_trip_data[:data][:attributes][:start_city]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:end_city)
    expect(road_trip_data[:data][:attributes][:end_city]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(road_trip_data[:data][:attributes]).to have_key(:weather_at_eta)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)

    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(road_trip_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(road_trip_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'returns 401 error if API key invalid', :vcr do
    User.create!(
      email: "dude@turing.com", 
      password: "pw123", 
      password_confirmation: "pw123", 
      api_key: "1a25138ffaf6ab1d60d1d01cd0")

    request_data = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "zzzzzzzzzz"
    }

    post '/api/v1/road_trip', params: request_data, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end


# POST /api/v1/road_trip
# Content-Type: application/json
# Accept: application/json

# body:

# {
#   "origin": "Denver,CO",
#   "destination": "Pueblo,CO",
#   "api_key": "jgn983hy48thw9begh98h4539h4"
# }

# {
#   "data": {
#     "id": null,
#     "type": "roadtrip",
#     "attributes": {
#       "start_city": "Denver, CO",
#       "end_city": "Estes Park, CO",
#       "travel_time": "2 hours, 13 minutes"
#       "weather_at_eta": {
#         "temperature": 59.4,
#         "conditions": "partly cloudy with a chance of meatballs"
#       }
#     }
#   }
# }

