class Hex < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :attachment, presence: true
  validates :wiproid, presence: true
  validates :deviceid, presence: true
end
