class Group < ActiveRecord::Base
  validates :name, uniqueness: true
end
