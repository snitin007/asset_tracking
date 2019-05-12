class Beacon < ApplicationRecord
  belongs_to :central
  has_one :employee
  validates :orientation, presence: true
  validates :distance, presence: true
  validates :sensor_id, presence: true

end
