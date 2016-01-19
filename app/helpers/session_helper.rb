module SessionHelper
    def log_in(user)
        session[:login] = user.login
        session[:user_id] = user.id
    end
    def log_out
        session.delete(:login)
        session.delete(:user_id)
    end
    def logged_as_student?
        Student.find_by(login: session[:login])
    end
    def logged_as_teacher?
        Teacher.find_by(login: session[:login])
    end
end
