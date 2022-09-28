require 'rails_helper'

RSpec.describe 'User Login API' do
  it 'returns the api key of an existing user', :vcr do
    User.create!(
      email: "dude@turing.com",
      password: "strongpw",
      password_confirmation: "strongpw",
      api_key: "superhexi"
    )

    request_data = {
              "email": "dude@turing.com",
              "password": "strongpw",
            }

    post "/api/v1/sessions", params: request_data, as: :json

    expect(response.status).to eq(200)
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

    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  
end


# status: 200
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