class SqresultsController < ApplicationController
  include ResultHelper
  before_action :correct_teacher, :create
  def create
    @sqresult = Sqresult.new(sqresult_params)
    reward = Sidequest.find(@sqresult.sidequest_id).reward
    points_in_percent = @sqresult.earned_points.to_i/100.to_f
    earned_points = points_in_percent * reward
    progres = Progre.find(@sqresult.student_id)
    progres.points += earned_points
    progres.save
    sqanswer = Sqanswer.find_by(student_id: @sqresult.student_id, sidequest_id: @sqresult.sidequest_id)
    sqanswer.read = true
    sqanswer.save
    student = Student.find(params[:sqresult][:student_id])
    if !params[:medal_id].empty?
      medal = Medal.find(params[:medal_id])
      give_a_medal_and_send_message(medal,student)
    end
    #MEDAL ZA UDZIAL W SIDEQUEST
    medal_id = Medal.find_by(name: "Odważny jak niedźwiedź").id 
    give_a_medal_and_send_message(medal_id, student) if !student.has_medal?(medal_id)
    message = Message.new(:subject => "Wyniki wyzwania", 
                          :content => "Zdobyłeś #{earned_points} punktów",
                          :read => false,
                          :direction => 0,
                          :student_id => @sqresult.student_id,
                          :teacher_id => session[:user_id])
    message.save
    respond_to do |format|
      if @sqresult.save
        format.html { redirect_to :back, notice: 'result was successfully created.' }
        format.json { render :show, status: :created, location: @sqresult }
      else
        format.html { render :new }
        format.json { render json: @sqresult.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def sqresult_params
    params.require(:sqresult).permit(:earned_points, :student_id, :level, :sidequest_id)
  end
end
