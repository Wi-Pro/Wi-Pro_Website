class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/0000000000"
  end

  def extension_white_list
    %w(hex)
  end
end
