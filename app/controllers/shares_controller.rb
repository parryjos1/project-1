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
    # @profit = stock.grossProfit
    # @peers = stock.peers
    # @logo = stock.logo
    # @chart = stock.chart
  end

  def new
    @share = Share.new
  end

  def create
    share = Share.create(
      name: params[:symbol],
      ticker: params[:ticker]
    )
    p = Portfolio.find(params[:id])
    p.shares << share

    redirect_to portfolio_path(params[:id])
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
    share = Share.find_by(ticker: params[:id])
    portfolio = Portfolio.find(params[:portfolio_id])
    portfolio.shares.delete(share)
    redirect_to portfolio_path(params[:portfolio_id])
  end


end
