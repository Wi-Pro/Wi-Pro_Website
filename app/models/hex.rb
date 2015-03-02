require 'file_size_validator'
class Hex < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :attachment,
    presence: true,
    :file_size => {
      :maximum => 64.kilobytes.to_i
    }
  validates :wiproid, presence: true
  validates :deviceid, presence: true

end
