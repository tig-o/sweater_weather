class ImageSerializer
  def self.display_image(image_data)
    {
      "data": {
        type: "image",
        id: nil,
        attributes: {
          location: image_data.location,
          image_url: image_data.image_url,
          credit: {
            source: image_data.source,
            author: image_data.author,
            logo: image_data.logo,
          }
        }
      }
    }
  end
end