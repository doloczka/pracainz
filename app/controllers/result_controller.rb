class ResultController < ApplicationController
    include ResultHelper
    def create
    @result = Result.new(result_params)
    @reward = Exercise.find(params[:result][:exercise_id]).reward
    @points_in_percent = (params[:result][:earned_points]).to_i/100.to_f
    earned_points = @points_in_percent * @reward
    @progres = Progre.find_by(student_id: params[:result][:student_id])
    @progres.gained_points += earned_points
    @progres.points += earned_points
    @progres.save
    answer = Answer.find_by(student_id: params[:result][:student_id], exercise_id: params[:result][:exercise_id])
    answer.read = true
    answer.save
    if !params[:medal_id].empty?
      student = Student.find(params[:result][:student_id])
      medal = Medal.find(params[:medal_id])
      give_a_medal(medal,student)
    end
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
    
end
