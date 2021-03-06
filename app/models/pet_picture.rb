class PetPicture < ActiveRecord::Base
  belongs_to :pet

  has_attached_file :asset,
    styles: {
    home: "",
    show_main: "640x360>",
    thumb: "100x100>",
  },
  convert_options: {
    home: "-strip -gravity north -thumbnail 456x342^ -extent 456x342",
    show_main: "-strip",
    thumb: "-quality 75 -strip",
  },
  default_url: "/images/:style/missing.png"

  process_in_background :asset, processing_image_url: :processing_image_fallback

  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :asset
  validates_attachment_size :asset, less_than: 5.megabytes

  # Copied from https://github.com/jrgifford/delayed_paperclip/#custom-image-for-processing
  def processing_image_fallback
    options = asset.options
    options[:interpolator].interpolate(options[:url], asset, :original)
  end
end
