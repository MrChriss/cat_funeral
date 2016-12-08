class WeatherService
  def initialize(date_string)
    @date_string = date_string
  end

  def weather_forecast
    # for cnt: 1 --> 1 day
    o = { cnt: 16, units: 'metric', APPID: '6e32f27d99669142cbfdd09d2be977a2' }
    OpenWeather.forecast("Ljubljana, SI", o)
  end

  def weather
    weather_forecast['list'].find { |day| Time.at(day['dt'])
      .to_date == Date.parse(@date_string) }
  end
end
