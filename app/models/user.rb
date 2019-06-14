class User < ApplicationRecord

  has_many :portfolios

  has_and_belongs_to_many :bitcoins

  has_many :shares, through: 'portfolios'

  has_secure_password

  #this is a method in the model that will be available to call whenever this model is being used
  def all_assets
    result = {}

    #create a new key value in the result hash by getting an array of all the shares a user owns
    # (we set up that users have many shares through portfolios and sum them)
    result[:stock_value] = self.shares.uniq.reduce(0) do |sum, current|
      sum + current.price * current.quantity
    end

    #Needed to get the current market price of bitcoin
    require 'json'
    url = 'https://api.coindesk.com/v1/bpi/currentprice.json'
    raw_response = HTTParty.get(url)
    response = JSON.parse(raw_response)
    @current_bitcoin_price = response['bpi']['USD']['rate'].tr(',', '').to_f.round(2)

    #Get the current value of bitcoin the user has
    if self.bitcoins.present?
      user_bcoin = self.bitcoins
      result[:bitcoin] = user_bcoin[0][:quantity] * @current_bitcoin_price
    else
      result[:bitcoin] = 0
    end



    result[:net_worth] = result[:bitcoin] + result[:stock_value] + self.funds

    result
  end


end
