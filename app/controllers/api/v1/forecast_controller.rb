class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = MapFacade.get_latitude_longitude(params[:location])
    forecast_data = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
    weather_objects = Weather.new(forecast_data)
    render json: ForecastSerializer.display_forecasts(weather_objects)
  end
end