class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    #This is where we add it to a users
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = @current_user.id
    @portfolio.save

    if @portfolio.persisted?
      redirect_to user_path(@current_user.id)
    else
      flash[:errors] = @portfolio.errors.full_messages
      render :new
    end
  end

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title)
  end

end
