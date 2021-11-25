class Weather < ApplicationRecord
  has_one :location, dependent: :destroy
  has_many :temperatures, dependent: :destroy

  validates :date, presence: true
  # validates :weather_index, presence: true, uniqueness: true
  accepts_nested_attributes_for :location, allow_destroy: true

  before_save :check_unique_date_name

  def self.destroy_search(start, last, lat, lon)
    where('date BETWEEN ? AND ?', start, last).joins(:location).where('lat = ? AND lon = ?', lat, lon)
  end

  def self.search(params)
    if params['date']
      where('date = ?', params['date'])
    elsif params['lat'] && params['lon']
      joins(:location).where('lat = ? AND lon = ?', params['lat'], params['lon'])
    else
      Weather.all
    end
  end

end
  