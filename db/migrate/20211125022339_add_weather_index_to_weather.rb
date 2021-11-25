class AddWeatherIndexToWeather < ActiveRecord::Migration[6.1]
  def change
    add_column :weathers, :weather_index, :integer
  end
end
