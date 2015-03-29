require 'file_size_validator'
class Hex < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :attachment,
    presence: true,
    :file_size => {
      :maximum => Device.find(Hex.last.deviceid).flash_size
    }
  #validates :wiproid, presence: true, length: {is: 10}
  validates :deviceid, presence: true

end
