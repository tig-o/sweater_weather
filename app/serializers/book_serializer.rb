class BookSerializer
  def self.display_book_weather_data(weather_data, books_data, location_data)
    # binding.pry
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location_data,
          forecast: {
            summary: weather_data.conditions,
            temperature: weather_data.temperature
          }
        },
        total_books_found: books_data[1],
        books: books_data[0].each do |book_info|
          # binding.pry
          book_info
        end
      }
    }
  end
end

# {
#   "data": {
#     "id": "null",
#     "type": "books",
#     "attributes": {
#       "destination": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       },
#       "total_books_found": 172,
#       "books": [
#         {
#           "isbn": [
#             "0762507845",
#             "9780762507849"
#           ],
#           "title": "Denver, Co",
#           "publisher": [
#             "Universal Map Enterprises"
#           ]
#         },
#         {
#           "isbn": [
#             "9780883183663",
#             "0883183668"
#           ],
#           "title": "Photovoltaic safety, Denver, CO, 1988",
#           "publisher": [
#             "American Institute of Physics"
#           ]
#         },
#         { ... same format for books 3, 4 and 5 ... }
#       ]
#     }
#   }
# }