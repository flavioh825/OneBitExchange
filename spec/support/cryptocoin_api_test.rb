RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /rest.coinapi.io/)
    .with(headers: {
      'Accept' => '*/*'
    }).to_return(status: 200, body: '
      {
        "time": "2019-08-11T14:31:18.3150000Z",
        "asset_id_base": "BTC",
        "asset_id_quote": "USD",
        "rate": 3260.3514321215056208129867667
      }', headers: {})
  end
end