class Api::V1::BooksController < ApplicationController
  def index
    # binding.pry
    if params[:location] == "" || params[:quantity] == ""
      render json: { message: "you are missing a parameter(s)"}, status: 400
    else
      coordinates = MapFacade.get_latitude_longitude(params[:location])
      forecast_data = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
      weather_objects = Weather.new(forecast_data)
      book_objects = BookFacade.get_books(params[:location], params[:quantity])

      render json: BookSerializer.display_book_weather_data(weather_objects, book_objects, params[:location])
    end
  end

end