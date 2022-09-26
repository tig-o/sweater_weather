class Weather
  attr_reader :id,
              :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @id = nil
    @datetime = Time.at(data[:current][:dt])
    @sunrise = Time.at(data[:current][:sunrise])
    @sunset = Time.at(data[:current][:sunset])
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like].to_f
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
    
    @hourly_weather = data[:hourly].first(8).map do |hour|
      HourlyWeather.new(hour) # sending hourly forecast objects to serialize through a weather object
    end

    @daily_weather = data[:daily].first(5).map do |day|
      DailyWeather.new(day) # sending daily forecast objects to serialize through a weather object
    end

  end
end