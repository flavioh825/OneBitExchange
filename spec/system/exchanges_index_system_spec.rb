require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :system, js: true do
  it "show exchanged value" do
    
    visit '/'

    fill_in 'amount', with: rand(1..9999)

    within("#exchange_form") do
      select('EUR', from: 'source_currency')
      select('USD', from: 'target_currency')
    end
  end
end
