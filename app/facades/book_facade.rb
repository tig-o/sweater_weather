class BookFacade
  def self.get_books(location, qty)
    books = BookService.get_books(location)

    books[:docs][0].map do |book|
      binding.pry
      # Book.new(book)
    end
  end
end