class Weather < ApplicationRecord
  has_one :location
  validates :date, presence: true
  validates :temperature, presence: true
  accepts_nested_attributes_for :location
end
