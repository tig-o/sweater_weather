class ImageService

  def self.get_image(location)
    response = unsplash_connection.get('/search/photos/') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_API_KEY']
      faraday.params['query'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.unsplash_connection
    Faraday.new(url: 'https://api.unsplash.com')
  end
end