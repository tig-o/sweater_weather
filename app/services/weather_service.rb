class WeatherService
  
  def self.get_forecasts(latitude, longitude)
    response = open_weather_connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
      faraday.params['lat'] = latitude
      faraday.params['lon'] = longitude
      faraday.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.open_weather_connection
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end