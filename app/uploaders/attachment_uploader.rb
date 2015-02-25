class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    hex = Hex.last
    "uploads/#{model.class.to_s.underscore}/#{hex.wiproid}"
  end

  def extension_white_list
    %w(hex)
  end
end
