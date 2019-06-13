class SharesController < ApplicationController

  def index
  end

  def search
    stock = StockQuote::Stock.quote(params[:symbol])
    puts "The Stock is #{stock}"
    @price = stock.latest_price
    @company = stock.company_name
    @symbol = stock.symbol
    @market_cap = stock.market_cap
    @year_high = stock.week52_high
    @year_low = stock.week52_low
    @ytd_change = "#{(stock.ytd_change*100).round(2)}%"
    @logo = StockQuote::Stock.logo(params[:symbol])
    
    # @chart  = StockQuote::Stock.chart(params[:symbol], '5y')
    # @profit = stock.grossProfit
    # @peers = stock.peers
    # @logo = stock.logo
    # @chart = stock.chart
    # share = Share.find_by(ticker: @symbol)
    current_portfolio = Portfolio.find params[:id]
    @stock_in_portfolio_id = current_portfolio.shares.find_by(ticker: params[:symbol])
  end

  def new
    @share = Share.new
  end

  def create
    # raise 'hell'
    if (params[:buy].to_i * params[:price].to_i) < @current_user.funds
      share = Share.create(
        name: params[:symbol],
        ticker: params[:ticker],
        quantity: params[:buy].to_i,
        price: params[:price].to_i
      )
      p = Portfolio.find(params[:id])
      p.shares << share

      @current_user.funds -= (params[:buy].to_i * params[:price].to_i)
      @current_user.save()

      redirect_to portfolio_path(params[:id])
    else
      flash[:notice] = "Insufficient Funds"
      redirect_to shares_search_path(params[:id], symbol: params[:ticker]), method: 'get'

    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    share = Share.find params[:id]
    portfolio = Portfolio.find(params[:portfolio_id])
    owned_qty = share.quantity
    sell_qty = params[:sell].to_i

    if (owned_qty - sell_qty) == 0
      # Selling down all holdings, delete from the database
      portfolio.shares.delete(share)
      redirect_to portfolio_path(params[:portfolio_id])

      #Logic to add funds
      @current_user.funds += (sell_qty * share.price)
      @current_user.save()
    elsif (owned_qty - sell_qty) > 0
      # Partial sell down of portfolio
      share.quantity -= sell_qty
      share.save()

      #logic to add funds to account
      @current_user.funds += (sell_qty * share.price)
      @current_user.save()
      redirect_to portfolio_path(params[:portfolio_id])
    else
      #Error you do not have enough units
      flash[:notice] = "You don't have enough of this stock"
      # raise 'hell'
      redirect_to shares_search_path(params[:portfolio_id], symbol: share.ticker), method: 'get'
    end


  end


end
