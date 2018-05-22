class WeatherController < ApplicationController
  def create
    request = AlexaRubykit::build_request(params)
    response = AlexaRubykit::Response.new
    # インテントからcityの文字列を受け取る
    city = request.slots[:city][:value]
    response.add_speech("#{city}を受け取りました")
    render json: response.build_response
  end
end
