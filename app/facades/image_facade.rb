class ImageFacade
  def self.get_image(location)
    image_data = ImageService.get_image(location)
    # binding.pry
    Image.new(image_data[:results].sample)
  end
end