class RoadTripSerializer
  def self.display_roadtrip_info(origin, destination, time, weather)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: time,
          weather_at_eta: {
            temperature: weather.temperature,
            conditions: weather.conditions
          }
        }
      }
    }
  end
end