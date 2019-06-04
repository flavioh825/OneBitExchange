RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://rest.coinapi.io/v1/exchangerate/BTC/USD")
    .with(headers: {
      'Accept'=>'application/json',
      'Accept-Encoding'=>'deflate, gzip',
      'X-Coinapi-Key'=>Rails.application.credentials[Rails.env.to_sym][:cryptocoin_api_key]
    }).to_return(status: 200, body: '
      {
        "time": "2019-08-11T14:31:18.3150000Z",
        "asset_id_base": "BTC",
        "asset_id_quote": "USD",
        "rate": 3260.3514321215056208129867667
      }', headers: {})
  end
end