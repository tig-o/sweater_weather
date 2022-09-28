class Image
  attr_reader :id,
              :location,
              :image_url,
              :source,
              :author,
              :logo

  def initialize(data)
    @id = nil
    @location = data[:user][:location]
    @image_url = data[:urls][:raw]
    @source = "www.unsplash.com"
    @author = data[:user][:username]
    @logo = data[:user][:portfolio_url]
  end
end