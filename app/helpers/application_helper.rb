module ApplicationHelper
    def curent_user_id
        session[:user_id]
    end
end
