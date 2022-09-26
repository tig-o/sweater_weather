require 'rails_helper'

RSpec.describe Book do
  it 'exists and had attributes' do
    dune = Book.new(
      isbn: [25, 3],
      title: "Dune",
      publisher: ["Chilton"]
    )

    expect(dune.isbn).to eq([25, 3])
    expect(dune.isbn).to be_an(Array)
    expect(dune.title).to eq("Dune")
    expect(dune.title).to be_a(String)
    expect(dune.publisher).to eq(["Chilton"])
    expect(dune.publisher).to be_an(Array)
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