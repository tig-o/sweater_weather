require 'rails_helper'

RSpec.describe 'Retrieve Weather API' do
  it 'sends weather based on city' do
    get '/api/v1/forecast?location=denver,co'
    
    expect(response).to be_successful
  end
end