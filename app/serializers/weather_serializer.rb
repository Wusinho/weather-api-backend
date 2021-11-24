class WeatherSerializer < ActiveModel::Serializer
  has_one :location
  attributes :date, :temperature
end
