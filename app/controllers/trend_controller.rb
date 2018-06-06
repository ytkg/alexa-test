class TrendController < ApplicationController
  def create
    request = AlexaRubykit::build_request(params)
    response = AlexaRubykit::Response.new

    num = request.slots[:num][:value]

    response.add_speech("#{num}個ですね")
    render json: response.build_response
  end
end
