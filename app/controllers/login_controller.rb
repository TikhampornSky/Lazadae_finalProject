class LoginController < ApplicationController
  def index
  end

  def create
    u = User.where(email: params[:email]).first
    if u && u.authenticate(params[:password])
        redirect_to '/profile'
        session[:logged_in] = true
        session[:user_id] = u.id
    else 
        session[:logged_in] = false
        redirect_to '/login', notice: 'Wrong Username or Password'
    end
  end

  def destroy
    reset_session
  end

end
