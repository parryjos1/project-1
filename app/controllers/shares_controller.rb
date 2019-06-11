class SharesController < ApplicationController

  def index
  end

  def search
    stock = StockQuote::Stock.quote(params[:stock_code])
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
      name: params[:company_name],
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
  end


end
