class BookService
  def self.get_books(location)
    response = open_library_connection.get("search.json?q=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.open_library_connection
    Faraday.new(url: 'http://openlibrary.org/')
  end
end