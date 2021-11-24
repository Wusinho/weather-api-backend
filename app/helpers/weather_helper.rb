module WeatherHelper
  def extract_create_temperatures(temp, id)
    temp.each { |ele| Temperature.create( weather_id: id, temperature: ele) }
  end

end