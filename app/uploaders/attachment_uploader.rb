class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    hex = Hex.last
    "uploads/#{model.class.to_s.underscore}/#{hex.wiproid}"
  end

  def extension_white_list
    %w(hex)
  end

  def filename
    "default.hex"
  end

  def size_range
    flash_size = Device.find(Hex.last.deviceid).flash_size
      0...flash_size
  end
end
