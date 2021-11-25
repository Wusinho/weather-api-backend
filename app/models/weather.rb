class Weather < ApplicationRecord
  has_one :location, dependent: :destroy
  has_many :temperatures, dependent: :destroy

  validates :date, presence: true
  validates :weather_index, presence: true, uniqueness: true
  accepts_nested_attributes_for :location, allow_destroy: true

  def self.destroy_search(start, last, lat, lon)
    where('date BETWEEN ? AND ?', start, last).joins(:location).where('lat = ? AND lon = ?', lat, lon)
  end

  def self.search(params)

    date = params['date']
    lat = params['lat']
    lon = params['lon']
    # byebug
    if date
      where('date = ?', date[1..-2]).order('weather_index ASC')
    elsif lat && lon
      order('weather_index ASC').joins(:location).where('lat = ? AND lon = ?', lat[1..-2], lon[1..-2])
    else
      Weather.all
    end
  end

end
  