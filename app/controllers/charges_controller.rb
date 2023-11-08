require 'net/http'
require 'net/https'

class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    
  end

  def create
    uri = URI('https://javelin.runpayments.io/api/v1/charge')
    headers = { 'Content-Type': 'application/json', 'Authorization': 'Bearer ' + 'tkn_ppc_h5cyUcYkBZFL584dkvR5QJcnNEZdtW' } # this is the secret key, hardcoded for demo purposes
    response = Net::HTTP.post(uri, params.merge(mid: '496160873888').to_json, headers)

    if response.code.to_s == '200'
      render json: response.body
    else
      render json: response.body, status: response.code
    end
  end
end
