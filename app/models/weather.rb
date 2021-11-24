class Weather < ApplicationRecord
  has_one :location
  has_many :temperatures
  validates :date, presence: true
  accepts_nested_attributes_for :location
end
