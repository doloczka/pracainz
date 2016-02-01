module ApplicationHelper
    def curent_user_id
        session[:user_id]
    end
    def current_user_login
        session[:login]
    end
end
