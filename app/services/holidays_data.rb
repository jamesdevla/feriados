class HolidaysData
  attr_reader :holidays_api_url
  attr_accessor :http_timeout
  
  HTTP_CONTENT_TYPE = 'application/json'
  SUCCESS_HTTP_STATUS = 200

  def initialize(holidays_api_url:)
    @holidays_api_url = holidays_api_url
    @http_logging = true
    @http_timeout = 10.seconds
  end

  def perform
    raise StandardError.new "holidays_api_url cannot be blank" if holidays_api_url.blank?
    
    Rails.logger.info logp("Process start")
    Rails.logger.info logp("Trying to get information")
    response = conn.get do |req|      
      req.url holidays_api_url
      req.headers['Content-Type'] = HTTP_CONTENT_TYPE
    end
    Rails.logger.info logp("HTTP status #{response.status}")

    if response.status == SUCCESS_HTTP_STATUS
      Rails.logger.info logp("the information has been obtained successfully")
      data = JSON.parse(response.body)
    else
      Rails.logger.info logp("The information could not be obtained")
      data = {}
    end
    Rails.logger.info logp("End of process")
    data
  end

  private

  def logp(msg)
    "#{self.class.name}: #{msg}"
  end

  def conn
    @conn ||= Faraday.new do |faraday|
      faraday.response :logger if @http_logging
      faraday.adapter Faraday.default_adapter
      faraday.options.timeout = http_timeout.seconds
    end
    @conn
  end
end
