class ResultController < ApplicationController
    
    def create
    @result = Result.new(result_params)
    @reward = Exercise.find(params[:result][:exercise_id]).reward
    @points_in_percent = (params[:result][:earned_points]).to_i/100
    @earned_points = @points_in_percent.to_i * @reward.to_i
    @progres = Progre.find_by(student_id: params[:result][:student_id])
    @progres.update_attributes(:expe => @earned_points, :points => @earned_points)
    @progres.save
    respond_to do |format|
      if @result.save
        format.html { redirect_to :back, notice: 'result was successfully created.' }
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
