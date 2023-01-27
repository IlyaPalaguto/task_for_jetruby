class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]

  version :medium do
    process :resize_to_limit => [200, 200]
  end

  version :small do
    process :resize_to_limit => [50, 50]
  end
end
