class StocksController < ApplicationController
  def new
  end

  def create
  end

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
