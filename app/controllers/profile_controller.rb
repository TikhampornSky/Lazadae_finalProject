class ProfileController < ApplicationController
  before_action :must_be_logged_in
  def index
    @myUser = User.find(session[:user_id])

    @user_id = session[:user_id]
    @email = @myUser.email
    @name = @myUser.name
    @user_type = @myUser.user_type
  end

  def changePassword
    @myUser = User.find(session[:user_id])
    @updating = @myUser.update(password: params[:password])
    if (@updating)
      reset_session
      redirect_to '/login', notice: "Change password successfully. Please login again ;)"
    else

    end
  end
end
