class Location < ApplicationRecord
  belongs_to :weather
  validates :lat, presence: true
  validates :lon, presence: true
  validates :city, presence: true
  validates :state, presence: true

end
