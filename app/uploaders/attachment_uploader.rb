class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    userid = $globaluserid
    checkout = Checkout.where("userid = ?", current_user.id).last.wiproid
    hex = Wiproid.find(checkout)
    "uploads/#{model.class.to_s.underscore}/#{hex.wiproid}"
  end

  def extension_white_list
    %w(hex)
  end

  def filename
    "default.hex"
  end

  def size_range
    0...65535
  end
end
