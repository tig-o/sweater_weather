require 'rails_helper'

RSpec.describe 'BookFacade' do
  it 'retrieve a num of books and the book objs' do
    books = BookFacade.get_books("denver", 5)

    # binding.pry
    # book_amount = books[1]

  end
end