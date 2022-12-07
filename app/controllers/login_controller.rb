class LoginController < ApplicationController
  def index
  end

  def create
    u = User.where(email: params[:email]).first
    if (!u)
      warining = ""
      if (params[:email] == "")
        warining = 'Username cannot be blank'
      else
        warining = 'Wrong Username'
      end
      redirect_to '/login', notice: "#{warining}"
    elsif u && u.authenticate(params[:password])
      session[:logged_in] = true
      session[:user_id] = u.id
      redirect_to '/main'
    else 
      session[:logged_in] = false
      warining = ""
      if (params[:password] == "")
        warining = 'Password cannot be blank'
      else
        warining = 'Wrong Password'
      end
      redirect_to '/login', notice: "#{warining}"
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
