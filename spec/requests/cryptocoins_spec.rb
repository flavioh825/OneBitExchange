require 'rails_helper'

RSpec.describe "Cryptocoins", type: :request do
  describe 'GET #convert' do
    before do
      @amount = rand(1..9999)
    end

    it 'returns http success' do
      get '/cryptocoin_convert', params: {
                        source_currency: "BRL",
                        target_currency: "BTC",
                        amount: @amount
                      }
      expect(response).to  have_http_status(200)
    end
  end
end
