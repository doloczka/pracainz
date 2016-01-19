class SessionController < ApplicationController
    
    def index
            redirect_to login_path
    end
    
    def new
    end
    
    def create
        student = Student.find_by(login: params[:session][:login])
        teacher = Teacher.find_by(login: params[:session][:login])
        if student && student.authenticate(params[:session][:password])
            log_in(student)
            if student.autenticated
                redirect_to student_path(student.id)
            else
                redirect_to edit_student_path(student.id)
            end
        elsif teacher && teacher.authenticate(params[:session][:password])
            log_in(teacher)
            redirect_to teacher
        else
            redirect_to login_path
        end
    end
    def destroy
        log_out
        redirect_to root_url
    end
        
end
