module SessionsHelper
  # Logs in a given user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the user whose currently logged in
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # Returns true is there exists a current user
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user
  def logout
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Remember a user in a persistant session
  def remember(user)
    # Create and store a new remeber token for the user
    user.remember
    # Store cookies on users browser
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Forgets a persistant session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  # Authenticate current user
  def authenticate
    if !logged_in?
      redirect_to login_path
    end
  end
end
