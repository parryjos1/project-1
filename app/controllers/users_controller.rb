class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      #log them in automatically
      session[:user_id] = @user.id

      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def show
    #This is where the user's portfolio is shown
    @user_portfolio = @current_user.portfolios

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
