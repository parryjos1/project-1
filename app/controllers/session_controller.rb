class SessionController < ApplicationController
  def new
  end

  def create

    #This is the action to which the login form post request is posted. It will add the users
    #ID to the session hash which will be used for authentication and authorisation

    # Seeif the the email actually exists in the user table
    user = User.find_by email: params[:email]

    # Is the email address valid, and is the password the right one for this address
    if user.present? && user.authenticate( params[:password] )
      # Successful login
      # Get rails to create a new session key to store the user's # ID
      # this is the key we will use to check if the user is still logged in
      # for all future pages
      session[:user_id] = user.id
      redirect_to user_path(user.id) #should redirect to the users portfolio page

    else
      #failed login
      flash[:error] = "Invalid email address or password"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
