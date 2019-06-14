class BitcoinsController < ApplicationController
  def new
  end

  def create
    if (params[:buy].to_i * params[:pricebcoin].to_i) < @current_user.funds
      bitcoin = Bitcoin.create(
        quantity: params[:buy].to_i,
        price: params[:pricebcoin].to_i
      )
      u = User.find(params[:id])
      u.bitcoins << bitcoin

      @current_user.funds -= (params[:buy].to_i * params[:pricebcoin].to_i)
      @current_user.save()

      redirect_to bitcoins_show_path(params[:id])

    else
      flash[:notice] = "Insufficient Funds"
      redirect_to bitcoins_show_path(params[:id])

    end
  end

  def show
    ###### BITCOIN LOGIC #############

    # Here we get the Data using HTTParty
    # We then convert it from JSON to ruby hash
    require 'json'
    url = 'https://api.coindesk.com/v1/bpi/currentprice.json'

    raw_response = HTTParty.get(url)
    response = JSON.parse(raw_response)
    @current_bitcoin_price = response['bpi']['USD']['rate'].tr(',', '').to_f.round(2)

    ## Show any user bitcoins
    current_user = User.find params[:id]
    user_bitcoins = current_user.bitcoins

    if user_bitcoins.present?
      @user_bitcoin_qty = user_bitcoins[0][:quantity]
      @bitcoin_id = user_bitcoins[0][:id]
      bitcoin_in_question = Bitcoin.find @bitcoin_id
      @bitcoin_return = (((@current_bitcoin_price / bitcoin_in_question[:price])-1)*100).round(2)
      @user_id_sell = params[:id]
    end


  end

  def edit
  end

  def update
  end

  def destroy
    bitcoin = Bitcoin.find params[:id]
    user = @current_user
    owned_qty = bitcoin.quantity
    sell_qty = params[:sell].to_i

    #sell down whole portfolio

    if (owned_qty - sell_qty) == 0
      user.bitcoins.delete(bitcoin)
      @current_user.funds += (sell_qty * bitcoin.price)
      @current_user.save()

      redirect_to bitcoins_show_path(@current_user.id)
    elsif (owned_qty - sell_qty) > 0
      bitcoin.quantity -= sell_qty
      bitcoin.save()
      @current_user.funds += (sell_qty * bitcoin.price)
      @current_user.save()
      redirect_to bitcoins_show_path(@current_user.id)
    else
      flash[:notice] = "Bummer man you don't have enough bitcoins"
      redirect_to bitcoins_show_path(@current_user.id)
    end
  end
end
