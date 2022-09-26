class MapService
  
  def self.get_latitude_longitude(location)
    response = map_quest_connection.get("/geocoding/v1/address") do |faraday|
      faraday.params['key'] = ENV['MAP_QUEST_API_KEY']
      faraday.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.map_quest_connection
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end