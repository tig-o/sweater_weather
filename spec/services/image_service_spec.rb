require 'rails_helper'

RSpec.describe 'ImageService' do
  it 'gets image information' do
    response = ImageService.get_image("denver,co")
    binding.pry
    expect(response).to be_a(Hash)
  end
end