class StaticPagesController < ApplicationController
  before_action :logged_in_customer, only: [:calendar, :weather, :reservation]

  def home
  end

  def calendar
  end

  def weather
    @weather_now = weather_now
    @weather_forecast = weather_forecast
  end

  private

  def weather_now
    o = { units: 'metric', APPID: '6e32f27d99669142cbfdd09d2be977a2' }
    OpenWeather.current("Ljubljana, SI", o)
  end

  def weather_forecast
    # for cnt: 1 --> 1 day
    o = { cnt: 16, units: 'metric', APPID: '6e32f27d99669142cbfdd09d2be977a2' }
    OpenWeather.forecast("Ljubljana, SI", o)
  end
end
