class Weather < ApplicationRecord
  has_one :location, dependent: :destroy
  has_many :temperatures, dependent: :destroy
  validates :date, presence: true
  accepts_nested_attributes_for :location, allow_destroy: true
end
