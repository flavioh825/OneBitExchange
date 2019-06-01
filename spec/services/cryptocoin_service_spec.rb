require 'spec_helper'
require 'json'
require './app/services/cryptocoin_service'

describe 'Cryptocoin' do
  it 'exchange' do
    amount = rand(0..9999)
    res = CryptocoinService.new("BRL", "BTC", amount).perform
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end