class Group < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :wiproids
  has_many :hexes
end
