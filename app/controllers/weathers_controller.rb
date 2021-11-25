class WeathersController < ApplicationController
  include WeatherHelper # to include the helpers
  def index
    @weathers = Weather.search(params)
    render json: @weathers
  end

  def create
    @weather = Weather.create!( weather_params)
    @weather.update(weather_index: params['id'])
    return unless @weather
    # byebug
    if @weather.valid?
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

    return Weather.destroy_all if params.keys.count < 4
    @weather.destroy_all

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
