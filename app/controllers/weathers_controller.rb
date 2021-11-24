class WeathersController < ApplicationController
  include WeatherHelper # to include the helpers
  def index
    @weathers = Weather.all
    render json: @weathers

  end

  def create
    @weather = Weather.create!(weather_params)    
    return unless @weather
    # byebug
    if @weather.valid?
      extract_create_temperatures(params[:temperature], @weather.id)
      render json: @weather
    end

  end
  
  def erase
    
  end

  private

  def weather_params
    weather_params = params.permit(:date, location: [:lat, :lon, :city, :state] )
    weather_params[:location_attributes] = weather_params.delete :location
    weather_params.permit!
  end

end
