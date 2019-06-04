require 'coinapi_v1'

class CryptocoinService
  def initialize(source_cryptocoin, target_cryptocoin, amount)
    @source_cryptocoin = source_cryptocoin
    @target_cryptocoin = target_cryptocoin
    @amount = amount.to_f
  end

  def perform
    begin
      cryptocoin_api_key = Rails.application.credentials[Rails.env.to_sym][:cryptocoin_api_key]
      coinapi = CoinAPIv1::Client.new(api_key: cryptocoin_api_key)
      exchange_rate = coinapi.exchange_rates_get_specific_rate(asset_id_base: @source_cryptocoin,
                                                              asset_id_quote: @target_cryptocoin)
      exchange_rate[:rate] * @amount
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end