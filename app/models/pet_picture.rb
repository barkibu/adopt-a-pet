class PetPicture < ActiveRecord::Base
  belongs_to :pet

  has_attached_file :asset,
    styles: {
    home: "340x150#",
    vertical: "360x640>",
    thumb: "100x100>",
  },
  convert_options: {
    home: "-strip",
    vertical: "-strip",
    thumb: "-quality 75 -strip",
  },
  default_url: "/images/:style/missing.png"

  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :asset
  validates_attachment_size :asset, less_than: 5.megabytes
end
