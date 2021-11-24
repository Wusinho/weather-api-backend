module WeatherHelper
  def extract_create_temperatures(temperatures, id)
    temperatures.each { |temp | Temperature.create( weather_id: id, temperature: temp ) }
  end

end