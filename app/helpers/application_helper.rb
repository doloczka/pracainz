module ApplicationHelper
    def curent_user_id
        session[:user_id]
    end
    def current_user_login
        session[:login]
    end
    
    def correct_teacher
      redirect_to root_url unless logged_as_teacher?
    end
    def logged_user
      redirect_to root_url unless logged_as_teacher? || logged_as_student?
    end
    def correct_student
        redirect_to root_url unless logged_as_student?
    end
end
