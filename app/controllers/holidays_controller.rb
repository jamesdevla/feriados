class HolidaysController < ApplicationController

  before_action :set_data, only: [:index]

  private
  
  def set_data
  	url = "#{ENV['HOLIDAYS_API_URL']}/#{Time.now.strftime('%Y')}"
    @data = HolidaysData.new(holidays_api_url: url).perform
  end
end
