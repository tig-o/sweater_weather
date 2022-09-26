class BookFacade
  def self.get_books(location, qty)
    books = BookService.get_books(location)
    book_collection = []
    books[:docs].first(qty.to_i).map do |book|
      book_collection << Book.new(book)
      # Book.new(book)
    end
    binding.pry
  end
end

# {:numFound=>8849,
#  :start=>0,
#  :numFoundExact=>true,
#  :docs=>
#   [{:key=>"/works/OL7919260W",
#     :type=>"work",
#     :seed=>["/books/OL7534653M", "/books/OL9773191M", "/works/OL7919260W", "/authors/OL2644662A"],
#     :title=>"Denver                              **",
#     :title_suggest=>"Denver                              **",
#     :edition_count=>2,
#     :edition_key=>["OL7534653M", "OL9773191M"],
#     :publish_date=>["July 1982", "1982"],
#     :publish_year=>[1982],
#     :first_publish_year=>1982,
#     :number_of_pages_median=>480,
#     :oclc=>["8545466"],
#     :isbn=>["0445047119", "9780449047118", "0449047113", "9780445047112"],
#     :last_modified_i=>1303831840,
#     :ebook_count_i=>0,
#     :ebook_access=>"no_ebook",
#     :has_fulltext=>false,
#     :public_scan_b=>false,
#     :publisher=>["Popular Library", "Fawcett Books"],
#     :language=>["eng"],
#     :author_key=>["OL2644662A"],
#     :author_name=>["John Dunning"],
#     :id_goodreads=>["572193", "1709509"],
#     :id_librarything=>["762567"],
#     :publisher_facet=>["Fawcett Books", "Popular Library"],
#     :_version_=>1735676409105350658,
#     :author_facet=>["OL2644662A John Dunning"]},
#    {:key=>"/works/OL26878533W",