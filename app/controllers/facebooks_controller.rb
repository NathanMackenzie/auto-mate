class FacebooksController < ApplicationController
  before_filter :authenticate
  
  def new
    @facebook = Facebook.new
  end
  
  def create
    @facebook = Facebook.create(email: facebook_params[:email], password: facebook_params[:account_password],
                                                              user_id: current_user.id)
    if facebook_params[:account_password] == facebook_params[:password_confirmation] && @facebook.save
      redirect_to profile_path
    else
      render 'new'
    end
  end
  
  private
    def facebook_params
      params.require(:facebook).permit(:email, :account_password, :password_confirmation)
    end
end
