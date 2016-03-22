class ResultController < ApplicationController
    before_action :correct_teacher, :create
    include ResultHelper
    def create
      @result = Result.new(result_params)
      exercise = Exercise.find(params[:result][:exercise_id])
      @reward = @result.exercise.reward
      @points_in_percent = (params[:result][:earned_points]).to_i/100.to_f # zamiana na procenty
      earned_points = @points_in_percent * @reward # obliczenie ile pkt otrzymuje gracz
      @progres = Progre.find_by(student_id: params[:result][:student_id]) 
      @progres.hp -= (100 - params[:result][:earned_points].to_i) * 0.2 # gracz traci hp za nie zdobyte procenty #przyznanie pktow
      @progres.gained_points += earned_points
      @progres.points += earned_points
      @progres.save
      #Informacja dla gracza że jego rozwiązanie zostało ocenione.
      Message.create!(teacher_id: session[:user_id],
                      student_id: params[:result][:student_id], 
                      subject: "Twoje rozwiązanie zostało ocenione !", 
                      content: "Rozwiązanie do zadania #{exercise.level}.#{exercise.number} zostało ocenione na #{params[:result][:earned_points]}%, zarobiłeś  #{earned_points} punktów !", 
                      direction: 0,
                      read: false)
      #Update odpowiedzi na przeczytaną
      answer = Answer.find_by(student_id: params[:result][:student_id], exercise_id: params[:result][:exercise_id])
      answer.read = true
      answer.save
      #przyznanie medalu
      student = Student.find(params[:result][:student_id])
      if !params[:medal_id].empty?

        medal = Medal.find(params[:medal_id])
        give_a_medal_and_send_message(medal.id,student) unless student.has_medal?(medal.id)
      end
      precision_medal = Medal.find_by(name: "Precyzja Odyna").id
      
      give_a_medal_and_send_message(precision_medal, student) if params[:result][:earned_points] = 100 && !student.has_medal?(precision_medal) 
    respond_to do |format|
      if @result.save
        format.html { redirect_to answers_path, notice: 'result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
    end
    
    private
    
    def result_params
      params.require(:result).permit(:student_id, :exercise_id, :level, :earned_points)
    end
    def correct_teacher
     redirect_to root_url unless logged_as_teacher?
    end
    
end
