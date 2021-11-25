class Weather < ApplicationRecord
  has_one :location, dependent: :destroy
  has_many :temperatures, dependent: :destroy

  validates :date, presence: true
  validates :weather_index, presence: true, uniqueness: true
  accepts_nested_attributes_for :location, allow_destroy: true

  def self.destroy_search(start, last, lat, lon)
    where('date BETWEEN ? AND ?', start, last).joins(:location).where('lat = ? AND lon = ?', lat, lon)
  end

  def self.search(date, lon, lat)
    if date
      where('date = ?', date).sort('weather_index')
    elsif lon && lat
      .sort('weather_index').joins(:location).where('lat = ? AND lon = ?', lat, lon)
    end
  end

end
  