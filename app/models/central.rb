class Central < ApplicationRecord
  has_many :beacons
  validates :room_id, uniqueness: true
end
