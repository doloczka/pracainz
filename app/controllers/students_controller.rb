class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :correct_student, only: :show
  before_action :correct_teacher, only: [:create, :destroy]
  
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

    def studentprofile
      if logged_as_student?
       @pkt=Result.where(student_id: session[:user_id])
       @medals=Student.find(session[:user_id]).awarded_medals.all
       @sidequests=Sqresult.where(student_id: session[:user_id])
       @prezences=Presence.where(student_id: session[:user_id])
      end
      if logged_as_teacher?
       @student =Student.find(params[:format])
       @pkt=Result.where(student_id: @student.id)
       @medals=AwardedMedal.where(student_id: @student.id)
       @sidequests=Sqresult.where(student_id: @student.id)
       @prezences=Presence.where(student_id: @student.id)
      end
    end
    
    
    def show
        @student = Student.find_by(login: session[:login])
        @progr=Progre.find_by(student_id: session[:user_id])
    end
  
    def hppotion
      pr = Progre.find_by(student_id: session[:user_id])
      if pr.hp <90 && pr.points>=30 
        hpnowe=pr.hp+20
        if hpnowe>100
          hpnowe=100
        end
        pr.update_column(:hp , hpnowe)
        pr.update_column(:points, pr.points-30)
      end
      if pr.save
        redirect_to :back
      end
    end
    
    def solution
        idzadania=Drawnexercise.find_by(student_id: session[:user_id], level: params[:answer][:level], number: params[:answer][:number])
        tre=Exercise.find_by(id: idzadania.exercise_id)
        @zad=Answer.find_by(student_id: session[:user_id], exercise_id: tre.id )
        @zad.update_column(:solution, params[:answer][:solution])
        @zad.update_column(:reward , params[:answer][:reward])
        if @zad.save
          redirect_to :back
        end
    end
 
  def create
    group = Group.find(params[:group_id])
    @student = group.students.create(new_student_params)
    @student.login = params[:student][:album_number]
    @student.password_digest = BCrypt::Password.create(params[:student][:album_number])
    respond_to do |format|
    if @student.save
            for i in 1..6
              presence = Presence.new(:student_id => @student.id, :classes_number => i, :present => true)
              presence.save
            end
        progrs = Progre.new(student_id: @student.id, points: 0, hp: 100, gained_points: 0, total: 0, lvl: 1)
        progrs.save
        format.html{redirect_to :back, notice: 'Stworzono studenta'}
    else
        format.html { redirect_to :back }
        format.json { render json: @student.errors, status: :unprocessable_entity }
    end
    end
  end

  def update
    respond_to do |format|
      if logged_as_student?
        @student.autenticated = true
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
      end
      
      if logged_as_teacher?
        if @student.update(student_params)
          format.html { redirect_to :back, notice: 'Student was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  end


  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  def settings
  end
  
  
  #################################################################3
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
     @student = Student.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:login, :password, :email, :name, :lastname)
    end
    def new_student_params
      params.require(:student).permit(:album_number)
    end
    
    def correct_student
        set_student
        redirect_to root_url unless @student == Student.find_by(login: session[:login])
    end
    def correct_teacher
      redirect_to root_url unless Teacher.find_by(login: current_user_login) 
    end
    
end
