class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :correct_student, only: :show
  before_action :correct_teacher, only: [:create, :destroy]
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
      wyzwanie.update_attributes(:recipient_answer => params[:zad][:odp] , :status=>"1")
      if wyzwanie.save
        redirect_to   student_challengeinbox_path
      end
    end
    def studentprofile
      if logged_as_student?
       @pkt=Result.where(student_id: session[:user_id])
       @medals=AwardedMedal.where(student_id: session[:user_id])
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
    #to chyna już nie poczebne #TODELETE
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
    #TODELETE
    def challengeinbox
        @wyzwania=Sidequest.where(recipient_id: session[:user_id])
    end
    
    def show
        @student = Student.find_by(login: session[:login])
        @progr=Progre.find_by(student_id: session[:user_id])
        
        
        
        time = Time.new.in_time_zone("Warsaw").strftime("%Y-%m-%d %H:%M:%S") 
        if time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id , classes_number: 1).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: @student.group_id, classes_number: 1).end.to_time.to_i
       
            assist(1)
         
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id, classes_number: 2).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: @student.group_id, classes_number: 2).end.to_time.to_i         
          if @progr.lvl!=2
            assist(2)
            checksolution(1)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id, classes_number: 3).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: @student.group_id, classes_number: 3).end.to_time.to_i  
          if @progr.lvl!=3
            assist(3)
            checksolution(2)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id, classes_number: 4).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: @student.group_id, classes_number: 4).end.to_time.to_i  
          if @progr.lvl!=4
            assist(4)
            checksolution(3)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id, classes_number: 5).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: @student.group_id, classes_number: 5).end.to_time.to_i 
          if @progr.lvl!=5
            assist(5)
            checksolution(4)
          end
        end
        if time.to_time.to_i>Classescalendar.find_by(group_id: @student.group_id, classes_number: 5).end.to_time.to_i
          #mid=Medal.find_by(name: "Medal za wytrwałość")
          if Progre.find(session[:user_id]).rate==nil
            checksolution(5)
            #do dopracowania
            checkpresense
            avg(session[:user_id])
          end
        end  
    end
    
    def checkpresense
      presences=Presence.where(student_id: session[:user_id])
      if presences.count==5
        medal=Medal.find_by(name: "Medal za wytrwałość")
        m=AwardedMedal.new(student_id: session[:user_id], medal_id: medal.id)
        m.save  
        Message.create!( student_id: session[:user_id], subject: "Dostałeś nagrodę specjalną !", content: "Właśnie otrzymałeś #{medal.description} !", direction: 0)
      end
    end
   
    def avg(stid)
      progr=Progre.find_by(student_id: stid)
      if progr.total!=0
        exp_mark=mark(progr.gained_points/progr.total)
      else
        exp_mark=2
      end
      medal_sum=0
      all_medal_sum=0
      AwardedMedal.where(student_id: stid).each do |m|
        medal_sum=medal_sum+Medal.find(m.medal_id).value
      end
      Medal.all.each do |m|
        all_medal_sum=all_medal_sum+Medal.find(m).value
      end
      medal_mark=mark(medal_sum / all_medal_sum)
      
      presences_mark=mark(Presence.where(student_id: stid).count / 5)
      
      mark=mark((exp_mark+medal_mark+presences_mark)/5)
      
      
      progr.update_column(:rate , mark)
    end
    
    def mark(percent)
        if percent>=0.51 && percent<=0.74
          ocena=3
        elsif percent >=0.75 && percent<=0.90
          ocena=4
        elsif percent>=0.91
        ocena=5
        else
          ocena=2
        end
      return ocena
    end
    
    def checksolution(lvl)
      progr=Progre.find_by(student_id: session[:user_id])
      for i in 1..5 do
        drawn=Drawnexercise.find_by(student_id: session[:user_id], level: lvl, number: i)
        #answer=Answer.find_by(student_id: session[:user_id], exercise_id: drawn.id)
        if drawn!=nil
          if Answer.find_by(student_id: session[:user_id], exercise_id: drawn.id)!=nil
            if Answer.find_by(student_id: session[:user_id], exercise_id: drawn.id).solution.nil? 
                progr.update_column(:hp, progr.hp-8)
                progr.save
                Message.create!(subject: "System",
                      content: "nie wykonano zadania #{lvl}-#{i}. Tracisz 8hp.",
                      read: false,
                      direction: 0,
                      student_id: session[:user_id]
                     )
            end
          end
        else
          progr.update_column(:hp, progr.hp-20)
          progr.update_column(:hp, progr.points-20)
                progr.save
                Message.create!(subject: "System",
                      content: "Nie rozwiązałeś zadań z poprzedniego levelu. Tracisz 20hp i 20 punktów rankingowych.",
                      read: false,
                      direction: 0,
                      student_id: session[:user_id]
                     )
          return
        end
      end
    end
    ###
    
    def assist(lev)
      @progr.update_column(:lvl, lev)
            @student = Student.find(session[:user_id])
            zad=Drawnexercise.find_by(student_id: @student.id ,level: lev)
            @progr=Progre.find_by(student_id: session[:user_id])
            if zad.nil?
              @gr=Group.find_by(id: @student.group_id)
              for i in 1..5 do
                exercount=Exercise.where(teacher_id: @gr.teacher_id, level: lev , number: i).count
                rnd= rand(1..exercount) #rand
                exer = Exercise.where(teacher_id: @gr.teacher_id, level: lev , number: i).first(rnd).last
                data={
                        "student_id"=>@student.id,
                        "level"=>lev,
                        "number"=>i,
                        "exercise_id"=>exer.id
                    }
                 @exer = Drawnexercise.create!(data)
                 answer_data = {
                      "teacher_id" => @gr.teacher_id,
                      "student_id" => @student.id,
                      "exercise_id" => exer.id,
                      "reward" => exer.reward,
                      "read" => false
                    }
                 if !Answer.exists?(:teacher_id => @gr.teacher_id, :student_id => session[:user_id], :exercise_id =>exer.id)
                      answer = Answer.new(answer_data)
                      answer.save
                      @progr.total += answer.reward
                      @progr.save
                 end
              end
            end
    end
#TODELETE
        # @zad=Drawnexercise.find_by(student_id: session[:user_id])
        # if @zad.nil?
        # @gr=Group.find_by(id: @student.group_id)
        # for j in 1..5 do
        #   for i in 1..5 do
        #     #zadania na dzien1
            
        #     wszystkiezadania=Exercise.where(teacher_id: @gr.teacher_id, level: j , number: i).count
        #     #los11= session[:user_id] % wszystkiezadania
        #     los11 = rand(1..wszystkiezadania)
        #     if los11==0
        #         los11=1
        #     end
        #     zad=Exercise.where(teacher_id: @gr.teacher_id, level: j , number: i).first(los11).last
        #     data={
        #         "student_id"=>session[:user_id],
        #         "level"=>j,
        #         "number"=>i,
        #         "exercise_id"=>zad.id
        #     }
        #     @zad=Drawnexercise.new(data)
        #     @zad.save
        #     answer_data = {
        #       "teacher_id" => @gr.teacher_id,
        #       "student_id" => session[:user_id],
        #       "exercise_id" => zad.id,
        #       "reward" => zad.reward,
        #       "read" => false
        #     }
        #     if !Answer.exists?(:teacher_id => @gr.teacher_id, :student_id => session[:user_id], :exercise_id =>zad.id)
        #       answer = Answer.new(answer_data)
        #       answer.save
              
        #       @progr.total += answer.reward
        #       @progr.save
        #     end
        #   end
        # end
        # end
   # end
    
    def hppotion
      pr = Progre.find_by(student_id: session[:user_id])
      if pr.hp <90 && pr.points>=30 
        hpnowe=pr.hp+20
        if hpnowe>100
          hpnowe=100
        end
        pr.update_column(:hp , hpnowe)
        pr.update_column(:points,pr.points-30)
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
        #byebug
        #@zad.update_column(:reward , params[:zad][:hint])
        if @zad.save
           redirect_to :back
        end
    end
    #TODELETE
    # def surender
    #   wyzwanie=Sidequest.find_by(id: params[:idwyzwania])
      
    #   wyzwany=Student.find_by(id: wyzwanie.recipient_id)
    #   wyzywjacy=Student.find_by(id: wyzwanie.challenger_id)
      
    #   wyzwany_progre=Progre.find_by(student_id: wyzwany.id)
      
    #   wyzwany_progre.update_column(:points , wyzwany_progre.points-5 )
    #   wyzwany_progre.save
    #   wyzywajacy_progre=Progre.find_by(student_id: wyzywjacy.id)
    #   wyzywajacy_progre.update_column(:points , wyzywajacy_progre.points+5)
    #   wyzywajacy_progre.save
    #   wyzwanie.update_column(:status , 2)
    #   wyzwanie.save
    #   redirect_to :back
    # end
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
    respond_to do |format|
    if @student.save
            for i in 1..5
              presence = Presence.new(:student_id => @student.id, :classes_number => i, :present => true)
              presence.save
            end
        progrs = Progre.new(student_id: @student.id, points: 0, hp: 100, gained_points: 0, total: 0, lvl: 1, won_challenges: 0, lost_challenges: 0)
        progrs.save
        format.html{redirect_to :back, notice: 'Stworzono studenta'}
    else
        format.html { redirect_to :back }
        format.json { render json: @student.errors, status: :unprocessable_entity }
    end
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
    
    def correct_student
        set_student
        redirect_to root_url unless @student == Student.find_by(login: session[:login])
    end
    def correct_teacher
      redirect_to root_url unless Teacher.find_by(login: current_user_login) 
    end
    
end
