class WeatherSerializer < ActiveModel::Serializer
  has_one :location
  has_many :temperatures
  attributes :date
end
