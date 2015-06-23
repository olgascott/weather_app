class WeatherReportController < ApplicationController
  require 'open_weather'

  def index
    @result = WeatherReport.get_weather('London')
  end

  def search
    @result = WeatherReport.get_weather(params[:city])
  end
end
