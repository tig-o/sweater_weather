class MapFacade
  def self.get_latitude_longitude(location)
    MapService.get_latitude_longitude(location)
  end
end