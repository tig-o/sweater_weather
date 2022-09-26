class WeatherFacade
  def self.get_forecasts(latitude, longitude)
    WeatherService.get_forecasts(latitude, longitude)
  end
end