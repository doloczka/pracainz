class SessionController < ApplicationController
    # layout :another_by_method
    # private
    # def another_by_method
    #     if logged_as_student?
    #         "application"
    #     elsif logged_as_teacher
    #         "teacher_layout"
    #     else
    #         "application"
    #     end
    # end
    def index
        if logged_as_teacher?
            redirect_to teacher_groups_path(session[:user_id])
        elsif logged_as_student?
            redirect_to student_path(session[:user_id])
        else
            redirect_to login_path
        end
    end
    
    def new
    end
    
    def create
        student = Student.find_by(login: params[:session][:login])
        teacher = Teacher.find_by(login: params[:session][:login])
        if student && student.authenticate(params[:session][:password])
            log_in(student)
            if student.autenticated == true
                redirect_to student_path(session[:user_id])
            else
                redirect_to edit_student_path(student.id)
            end
        elsif teacher && teacher.authenticate(params[:session][:password])
            log_in(teacher)
            redirect_to teacher_groups_path(session[:user_id])
        else
            redirect_to login_path
        end
    end
    def destroy
        log_out
        redirect_to root_url
    end
        
end
