class Api::V1::ImageController < ApplicationController
  def index
    image_data = ImageFacade.get_image(params[:location])
    render json: ImageSerializer.display_image(image_data)
  end
end