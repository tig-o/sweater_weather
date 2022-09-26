require 'rails_helper'

RSpec.describe 'BookService' do
  it 'gets books and info' do
    response = BookService.get_books("denver,co")
    
    expect(response).to be_a(Hash)
    expect(response[:numFound]).to be_an(Integer)
    expect(response[:docs]).to be_an(Array)
    expect(response[:docs][0][:title]).to be_a(String)
    expect(response[:docs][0][:isbn]).to be_an(Array)
  end
end