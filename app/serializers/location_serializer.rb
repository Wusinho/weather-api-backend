class LocationSerializer < ActiveModel::Serializer
  belongs_to :weather
  attributes :lon, :lat, :city, :state
end
