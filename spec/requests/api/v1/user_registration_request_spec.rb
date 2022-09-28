require 'rails_helper'

RSpec.describe 'User Registration API' do
  it 'creates a unique user and generates api key for user', :vcr do
    data = {
              "email": "user1@turing.edu",
              "password": "strongpw123",
              "password_confirmation": "strongpw123"
            }

    post "/api/v1/users", params: data, as: :json

    expect(response.status).to eq(201)
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("users")

    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(Integer)

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'returns 400 error if email is already utilized', :vcr do
    data = {
            "email": "user1@turing.edu",
            "password": "strongpw123",
            "password_confirmation": "strongpw123"
           }

    post "/api/v1/users", params: data, as: :json

    data = {
            "email": "user1@turing.edu",
            "password": "strongpw123",
            "password_confirmation": "strongpw123"
           }

    post "/api/v1/users", params: data, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end

  it 'returns 400 error if passwords do not match', :vcr do
    data = {
            "email": "user1@turing.edu",
            "password": "weakpw",
            "password_confirmation": "strongpw123#$%^POWElsdfki34POIS"
           }

    post "/api/v1/users", params: data, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end


# POST /api/v1/users
# Content-Type: application/json
# Accept: application/json

# {
#   "email": "whatever@example.com",
#   "password": "password",
#   "password_confirmation": "password"
# }

# status: 201
# body:

# {
#   "data": {
#     "type": "users",
#     "id": "1",
#     "attributes": {
#       "email": "whatever@example.com",
#       "api_key": "jgn983hy48thw9begh98h4539h4"
#     }
#   }
# }