class ApplicationController < ActionController::Base
    before_action :my_debug

    def my_debug
        pp "------------------------------------"
        pp session.to_h
    end

    def is_login?
        return session[:logged_in] == true
    end

    def must_be_logged_in
        if is_login?
            return true
        else
            redirect_to '/login', notice: "You must login"
        end
    end

    def role
        @myrole = User.find(session[:user_id]).user_type
        if (@myrole == 0)
            @myrole = 'admin'
        elsif (@myrole == 1)
            @myrole = 'seller'
        else
            @myrole = 'buyer'
        end
    end

end
