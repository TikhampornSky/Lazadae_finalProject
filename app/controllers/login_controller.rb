class LoginController < ApplicationController
  def index
  end

  def create
    u = User.where(email: params[:email]).first
    if (!u)
      session[:logged_in] = false
      p "======="
      p params[:email]
      p "======="
      p u
      redirect_to '/login', notice: 'Wrong Username'
    elsif u && u.authenticate(params[:password])
      session[:logged_in] = true
      session[:user_id] = u.id
      redirect_to '/main'
    else 
      session[:logged_in] = false
      redirect_to '/login', notice: 'Wrong Password'
    end
  end

  def destroy
    reset_session
    redirect_to '/main'
  end

  def tryy
    @e = params[:email]
    @p = params[:password]
  end

end
