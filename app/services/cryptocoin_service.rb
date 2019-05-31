require 'rest-client'
require 'json'

class CryptocoinService
  def initialize(source_cryptocoin, target_cryptocoin, amount)
    @source_cryptocoin = source_cryptocoin
    @target_cryptocoin = target_cryptocoin
    @amount = amount.to_f
  end

  def perform
    begin
      cryptocoin_api_url = Rails.application.credentials[Rails.env.to_sym][:cryptocoin_api_url]
      cryptocoin_api_key = Rails.application.credentials[Rails.env.to_sym][:cryptocoin_api_key]
      url = "#{cryptocoin_api_url}v1/exchangerate/#{@source_cryptocoin}/#{@target_cryptocoin}"

      res = RestClient.get url, headers={"X-CoinAPI-Key": cryptocoin_api_key}
      value = JSON.parse(res.body)['rate'].to_f
      value * @amount
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end