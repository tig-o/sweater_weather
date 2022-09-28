class Api::V1::RoadTripController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { message: "API Key not valid" }, status: 401
    else
      coordinates = MapFacade.get_latitude_longitude(params[:destination])
      forecast_data = WeatherFacade.get_forecasts(coordinates[:lat], coordinates[:lng])
      weather_objects = Weather.new(forecast_data)
      road_trip_data = MapFacade.get_roadtrip_directions(params[:origin], params[:destination])[:route]
      
      time = road_trip_data[:formattedTime]
      arriving_time = Time.now + road_trip_data[:legs][0][:time]
      arriving_weather = weather_objects.hourly_weather.find { |hour| hour.time[0..2].to_i == arriving_time.hour }

      render json: RoadTripSerializer.display_roadtrip_info(params[:origin], params[:destination], time, arriving_weather)
    end
  end
end
