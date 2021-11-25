class WeathersController < ApplicationController
  include WeatherHelper # to include the helpers
  def index
    @weathers = Weather.search(params)
    render json: @weathers, status: :ok
  end

  def create
    @weather = Weather.new( weather_params)
    @weather.update(weather_index: params['id'])
    return unless @weather
    # byebug
    if @weather.save
      extract_create_temperatures(params[:temperature], @weather.id)
      render json: @weather
    end

  end

  def erase
    @weather = Weather.destroy_search(
      params['start'], 
      params['end'],
      params['lat'],
      params['lon']
    )
    @weather.empty? ? Weather.destroy_all : @weather.destroy_all

    render json: {
      status: :ok
    }
  end

  private

  def weather_params
    weather_params = params.permit(:date, :weather_index, location: [:lat, :lon, :city, :state] )
    weather_params[:location_attributes] = weather_params.delete :location
    weather_params.permit!
  end

end
