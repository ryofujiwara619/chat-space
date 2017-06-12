class ImageUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick
  storage :file
  process :resize_to_limit => [100, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
