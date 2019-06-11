class ApplicationController < ActionController::Base

  #before any action is performed, call the fetch_user method
  before_action :fetch_user

  private

  def fetch_user
    #Search for a user by their user ID if we can find one in the session hash
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
      #clear out the session user_id if no user if found
      session[:user_id] = nil unless @current_user.present?
    end
  end

  def check_if_logged_in
    unless @current_user.present?
      flash[:error] = "You must be logged in to view that page"
    end
  end




end
