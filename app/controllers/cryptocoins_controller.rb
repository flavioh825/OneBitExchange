class CryptocoinsController < ApplicationController
  def convert
    value = CryptocoinService.new(
        params[:source_cryptocoin], params[:target_cryptocoin], params[:amount]).perform
    render json: {"value": value}
  end
end
