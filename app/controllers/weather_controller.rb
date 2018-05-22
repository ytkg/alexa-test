class WeatherController < ApplicationController
  def create
    request = AlexaRubykit::build_request(params)
    response = AlexaRubykit::Response.new

    # インテントからcityの文字列を受け取る
    city = request.slots[:city][:value]
    
    # cityの文字列からWeatherReportのID形式の値を取得する 
    id = WeatherReport::Weather.request_cityid(city)
    
    # IDが取得できたら、明日の天気を調べて応答する
    if id
      weather = WeatherReport::Weather.new(id)
      weather.tomorrow.date
      response.add_speech("#{city}の明日の天気は#{weather.tomorrow.telop}です。")
    else
      response.add_speech("#{city}の天気が調べられませんでした")
    end 
    render json: response.build_response
  end
end
