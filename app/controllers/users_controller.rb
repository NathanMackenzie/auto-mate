class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    
  end  
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirm)
    end
end
