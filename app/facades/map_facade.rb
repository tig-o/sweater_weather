class MapFacade
  def self.get_latitude_longitude(location)
    MapService.get_latitude_longitude(location)
  end

  def self.get_roadtrip_directions(origin, destination)
    MapService.get_roadtrip_directions(origin, destination)
  end
end