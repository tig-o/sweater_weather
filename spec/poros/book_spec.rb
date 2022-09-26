require 'rails_helper'

RSpec.describe Book do
  it 'exists and had attributes' do
    dune = Book.new(
      isbn: [25, 3],
      title: "Dune",
      publisher: ["Chilton"]
    )

    expect(dune).to be_an_instance_of(Book)
  end
end

      # "books": [
      #   {
      #     "isbn": [
      #       "0762507845",
      #       "9780762507849"
      #     ],
      #     "title": "Denver, Co",
      #     "publisher": [
      #       "Universal Map Enterprises"
      #     ]
      #   },