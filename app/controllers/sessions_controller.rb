class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create 
    user = User.find_by_email(params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      render 'new'
    end
  end
  
  def destroy
    logout if logged_in?
    session[:user_id] = nil
    redirect_to root_url
  end
end
