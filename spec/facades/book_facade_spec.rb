require 'rails_helper'

RSpec.describe 'BookFacade' do
  it 'retrieve a num of books and the book objs' do
    book_info = BookFacade.get_books("denver", 5)

    book_collection = book_info[0]
    expect(book_collection).to be_an(Array)
    expect(book_collection.count).to eq(5)
    expect(book_collection.first).to be_a(Book)

    book_amount = book_info[1]
    expect(book_amount).to be_an(Integer)
    expect(book_amount).to_not be_a(Book)
  end
end