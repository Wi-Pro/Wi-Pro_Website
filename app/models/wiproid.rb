class Wiproid < ActiveRecord::Base
  #validates :name, presence: true
  validates :wiproid, presence: true, length: {is: 10} #wiproid must be 10 digits long
  validates :groupid, presence: true
end
