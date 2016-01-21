class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end
 
  # GET /students/1
  # GET /students/1.json
    def challenge
        student=Student.find(session[:user_id])
        @idgru=Student.where(group_id: student.group_id)
    end
    
    def chosechallenge
        poziom=Progre.find_by(student_id: session[:user_id])
        @zadania=Exercise.where(level: poziom.lvl)   
        @wyzwany=Student.find(params[:idst])
    end
    
    def challengeconfirm2
      wyzwanie=Sidequest.find(params[:zad][:wyzwanie])
      wyzwanie.update_attributes(:recipient_id => params[:zad][:odp] , :status=>"1")
      if wyzwanie.save
        redirect_to   student_challengeinbox_path
      end
    end
    
    def challengeconfirm
        student=Student.find(session[:user_id])
        grupa=Group.find_by(student.group_id)
        zadanie=Exercise.find(params[:zad][:zadanie])
        data={
            "teacher_id" => grupa.teacher_id ,
            "level" => zadanie.level ,
            "content" => zadanie.content ,
            "challenger_id" => session[:user_id],
            "challenger_answer" => params[:zad][:odp],
            "recipient_id" => params[:zad][:wyzwany],
            "recipient_answer" => "",
            "status" => "0"  #status odpowiada stanom: 0 jak zadanie rozwiazane przez challengera
            #1 jak recipient dodaje swoja odpowiedz i 2 kiedy zostaje sprawdzona
        }
        Sidequest.new(data).save
        redirect_to  student
    end
    
    def challengeinbox
        @wyzwania=Sidequest.where(recipient_id: session[:user_id])
    end
    
    def show
        @student = Student.find_by(login: session[:login])
        @progr=Progre.find_by(student_id: session[:user_id])

        @zad=Drawnexercise.find_by(student_id: session[:user_id])
        if @zad.nil?
         @gr=Group.find_by(id: @student.group_id)
         for j in 1..5 do
          for i in 1..5 do
            #zadania na dzien1
            
            wszystkiezadania=Exercise.where(teacher_id: @gr.teacher_id, level: j , number: i).count
            los11= session[:user_id] % wszystkiezadania
            if los11==0
                los11=1
            end
            zad=Exercise.where(teacher_id: @gr.teacher_id, level: j , number: i).first(los11).last
            data={
                "student_id"=>session[:user_id],
                "level"=>j,
                "number"=>i,
                "exercise_id"=>zad.id
            }
            @zad=Drawnexercise.new(data)
            @zad.save
          end
         end
        end
       gr= Student.find(session[:user_id])
       progresy=Progre.order(points: :desc)
        i=1
        k=0
       progresy.each do |pr|
       k=k+1
            if pr.student_id==session[:user_id]
                @ran=i
                @j=k
            end
            gru=Student.find(pr.student_id)
            if gru.group_id==gr.group_id
                i=i+1
            end
       end
    end
    def solution
       
        @zad=Answer.find_by(student_id: session[:user_id])
        idzadania=Drawnexercise.find_by(student_id: session[:user_id], level: params[:zad][:level], number: params[:zad][:number])
        tre=Exercise.find_by(id: idzadania.exercise_id)
        @zad.update_attributes(:solution => params[:zad][:odp], :exercise_id =>  tre.id, :reward => params[:zad][:punkty])
        if @zad.save
           redirect_to :back
        end
    end


  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    group = Group.find(params[:group_id])
    @student = group.students.create(new_student_params)
    @student.login = params[:student][:album_number]
    @student.password_digest = BCrypt::Password.create(params[:student][:album_number])
      if @student.save
        progrs = Progre.new(student_id: @student.id, points: 0, hp: 100, expe: 0, lvl: 1)
        progrs.save
        redirect_to :back
      else
        redirect_to :back
      end
      
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
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

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
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
end