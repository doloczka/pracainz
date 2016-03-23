class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :another_by_method
  private
  def another_by_method
    if logged_as_student?
        "student_layout"
    elsif logged_as_teacher?
        "teacher_layout"
    else
        "application"
    end
  end
  protect_from_forgery with: :exception
  helper_method :verification

  def verification
        @student = Student.find_by(login: session[:login])
        @progr=Progre.find_by(student_id: session[:user_id])
        student = Student.find_by(login: session[:login])
        progr=Progre.find_by(student_id: session[:user_id])
              time = Time.new.in_time_zone("Warsaw").strftime("%Y-%m-%d %H:%M:%S") 
        
        if @progr.variant.nil?
          teacher=Group.find(student.group_id)
          exer=Exercise.where(teacher_id: teacher.teacher_id, level: 1 , number: 1).order(variant: :desc).first.variant
          if exer!=nil
            randed=rand(1..exer)
            @progr.update_column(:variant, randed)
          else
            @progr.update_column(:variant, 1)
          end
        end
          
        if time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id , classes_number: 1).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 1).end.to_time.to_i
       
            assist(1)
         
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 2).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 2).end.to_time.to_i         
          if progr.lvl!=2
            assist(2)
            checksolution(1)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 3).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 3).end.to_time.to_i  
          if progr.lvl!=3
            assist(3)
            checksolution(2)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 4).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 4).end.to_time.to_i  
          if progr.lvl!=4
            assist(4)
            checksolution(3)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 5).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 5).end.to_time.to_i 
          if progr.lvl!=5
            assist(5)
            checksolution(4)
          end
        elsif time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 6).start.to_time.to_i && time.to_time.to_i<Classescalendar.find_by(group_id: student.group_id, classes_number: 6).end.to_time.to_i 
          if progr.lvl!=6
            assist(6)
            checksolution(5)
          end
        end
        if time.to_time.to_i>Classescalendar.find_by(group_id: student.group_id, classes_number: 6).end.to_time.to_i
          if Progre.find(session[:user_id]).rate==nil
            checksolution(6)
            avg(session[:user_id])
            checkpresense
          end
        end
  end
 
    def checkpresense
      presences=Presence.where(student_id: session[:user_id])
      if presences.count==6
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
      medal_sum=AwardedMedal.where(student_id: session[:user_id]).count
      presences_mark=mark(Presence.where(student_id: stid).count / 5)
      grid=(exp_mark*3+presences_mark) / 4 
      progr.update_column(:rate , grid+(medal_sum*0.2))
    end
    
    def mark(percent)
        if percent>=0.51 && percent<=0.60
          ocena=3
        elsif percent >=0.61 && percent<=0.70
          ocena=3.5
        elsif percent >=0.75 && percent<=0.80
          ocena=4
        elsif percent >=0.81 && percent<=0.90
          ocena=4.5
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
    
    def assist(lev)
      @progr.update_column(:lvl, lev)
            @student = Student.find(session[:user_id])
            zad=Drawnexercise.find_by(student_id: @student.id ,level: lev)
            @progr=Progre.find_by(student_id: session[:user_id])
            if zad.nil?
              @gr=Group.find_by(id: @student.group_id)
              for i in 1..5 do
                exercount=Exercise.where(teacher_id: @gr.teacher_id, level: lev , number: i, variant: @progr.variant).count
                rnd= rand(1..exercount) #rand
                exer = Exercise.where(teacher_id: @gr.teacher_id, level: lev , number: i, variant: @progr.variant).first(rnd).last
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
  
   
 
end
