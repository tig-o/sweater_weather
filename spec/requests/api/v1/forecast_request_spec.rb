require 'rails_helper'

RSpec.describe 'Retrieve Weather API' do
  it 'sends weather based on city', :vcr do
    get '/api/v1/forecast?location=miami,fl'

    expect(response.status).to eq(200)
    expect(response).to be_successful

    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data]).to have_key(:type)
    expect(forecasts[:data][:type]).to eq "forecast"
    expect(forecasts[:data]).to have_key(:attributes)
    expect(forecasts[:data][:attributes]).to be_a(Hash)

    forecast_type = forecasts[:data][:attributes]
    expect(forecast_type[:current_weather]).to be_a(Hash)
    expect(forecast_type[:daily_weather]).to be_an(Array)
    expect(forecast_type[:hourly_weather]).to be_an(Array)

    current_forecast = forecast_type[:current_weather]
    expect(current_forecast[:datetime]).to be_a(String)
    expect(current_forecast[:sunrise]).to be_a(String)
    expect(current_forecast[:sunset]).to be_a(String)
    expect(current_forecast[:temperature]).to be_a(Float)
    expect(current_forecast[:feels_like]).to be_a(Float)
    expect(current_forecast[:humidity]).to be_an(Integer)
    expect(current_forecast[:visibility]).to be_an(Integer)
    expect(current_forecast[:conditions]).to be_a(String)
    expect(current_forecast[:icon]).to be_a(String)

    daily_forecast = forecast_type[:daily_weather]
    daily_forecast.each do |day|
      expect(day[:icon]).to be_a(String)
      expect(day[:date]).to be_a(String)
      expect(day[:sunset]).to be_a(String)
      expect(day[:sunrise]).to be_a(String)
      expect(day[:max_temp]).to be_a(Float)
      expect(day[:min_temp]).to be_a(Float)
      expect(day[:conditions]).to be_a(String)
    end

    hourly_forecast = forecast_type[:hourly_weather]
    hourly_forecast.each do |hour|
      expect(hour[:time]).to be_a(String)
      expect(hour[:icon]).to be_a(String)
      expect(hour[:temperature]).to be_a(Float)
      expect(hour[:conditions]).to be_a(String)
    end
  end
end

# => {:data=>
#   {:id=>nil,
#    :type=>"forecast",
#    :attributes=>
#     {:current_weather=>
#       {:datetime=>"2022-09-26T06:40:04.000-06:00",
#        :sunrise=>"2022-09-26T05:10:54.000-06:00",
#        :sunset=>"2022-09-26T17:13:14.000-06:00",
#        :temperature=>80.26,
#        :feels_like=>86.2,
#        :humidity=>89,
#        :uvi=>0.74,
#        :visibility=>10000,
#        :conditions=>"overcast clouds",
#        :icon=>"04d"},
#      :daily_weather=>
#       [{:date=>"2022-09-26",
#         :sunrise=>"2022-09-26T05:10:54.000-06:00",
#         :sunset=>"2022-09-26T17:13:14.000-06:00",
#         :max_temp=>85.75,
#         :min_temp=>77.88,
#         :conditions=>"moderate rain",
#         :icon=>"10d"},
#        {:date=>"2022-09-27",
#         :sunrise=>"2022-09-27T05:11:18.000-06:00",
#         :sunset=>"2022-09-27T17:12:08.000-06:00",
#         :max_temp=>84.15,
#         :min_temp=>78.64,
#         :conditions=>"moderate rain",
#         :icon=>"10d"},
#        {:date=>"2022-09-28",
#         :sunrise=>"2022-09-28T05:11:42.000-06:00",
#         :sunset=>"2022-09-28T17:11:02.000-06:00",
#         :max_temp=>86.18,
#         :min_temp=>82.56,
#         :conditions=>"moderate rain",
#         :icon=>"10d"},
#        {:date=>"2022-09-29",
#         :sunrise=>"2022-09-29T05:12:07.000-06:00",
#         :sunset=>"2022-09-29T17:09:56.000-06:00",
#         :max_temp=>87.64,
#         :min_temp=>83.3,
#         :conditions=>"light rain",
#         :icon=>"10d"},
#        {:date=>"2022-09-30",
#         :sunrise=>"2022-09-30T05:12:31.000-06:00",
#         :sunset=>"2022-09-30T17:08:50.000-06:00",
#         :max_temp=>87.57,
#         :min_temp=>82.65,
#         :conditions=>"light rain",
#         :icon=>"10d"}],
#      :hourly_weather=>
#       [{:time=>"06:00:00", :temperature=>80.74, :conditions=>"overcast clouds", :icon=>"04d"},
#        {:time=>"07:00:00", :temperature=>80.26, :conditions=>"overcast clouds", :icon=>"04d"},
#        {:time=>"08:00:00", :temperature=>80.98, :conditions=>"overcast clouds", :icon=>"04d"},
#        {:time=>"09:00:00", :temperature=>82.24, :conditions=>"overcast clouds", :icon=>"04d"},
#        {:time=>"10:00:00", :temperature=>84, :conditions=>"light rain", :icon=>"10d"},
#        {:time=>"11:00:00", :temperature=>84.58, :conditions=>"overcast clouds", :icon=>"04d"},
#        {:time=>"12:00:00", :temperature=>85.69, :conditions=>"light rain", :icon=>"10d"},
#        {:time=>"13:00:00", :temperature=>85.28, :conditions=>"moderate rain", :icon=>"10d"}]}}}