require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes', :vcr do
    response = BackgroundService.get_image("denver,co")

    img_obj = Image.new(response[:results].sample)

    expect(img_obj.logo).to be_a(String)
    expect(img_obj.source).to be_a(String)
    expect(img_obj.author).to be_a(String)
    expect(img_obj.location).to be_a(String)
    expect(img_obj.image_url).to be_a(String)
    expect(img_obj).to be_an_instance_of(Image)
  end
end

# status: 200
# body:
# {
#   "data": {
#     "type": "image",
#     "id": null,
#     "attributes": {
#       "image": {
#         "location": "denver,co",
#         "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
#         "credit": {
#           "source": "pixabay.com",
#           "author": "quinntheislander",
#           "logo": "https://pixabay.com/static/img/logo_square.png"
#         }
#       }
#     }
#   }
# }