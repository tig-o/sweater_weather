require 'rails_helper'

RSpec.describe 'BookService' do
  it 'gets books and info' do
    response = BookService.get_books("denver,co")
    binding.pry
  end
end