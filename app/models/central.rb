class Central < ApplicationRecord
  has_many :beacons
  validates :room_id, uniqueness: true
  validates :room_id, presence: true
  validates :room_name, presence: true
end
