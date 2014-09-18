class Shelter < ActiveRecord::Base
  has_attached_file :logo,
    styles: { thumb: "160x50>" },
    convert_options: { thumb: "-quality 75 -strip"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :logo, less_than: 5.megabytes

  validates :name, presence: true
end
