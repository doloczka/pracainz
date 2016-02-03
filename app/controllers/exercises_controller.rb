class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :correct_teacher, only: [:index, :show_exe, :destroy, :edit, :create, :new, :destroy]
  before_action :logged_user, only: [:show, :update]
  
  def lesson
    #@level = params[:level]
    #@student = Student.find_by(login: session[:login])
    #zad=Drawnexercise.find_by(student_id: @student.id)
    #@progr=Progre.find_by(student_id: session[:user_id])
    #if zad.nil?
    #  @gr=Group.find_by(id: @student.group_id)
    #  for i in 1..5 do
    #    exercount=Exercise.where(teacher_id: @gr.teacher_id, level: @level , number: i).count
    #    rnd= rand(1..exercount) #rand
    #    exer = Exercise.where(teacher_id: @gr.teacher_id, level: @level , number: i).first(rnd).last
    
    
    #    data={
    #            "student_id"=>@student.id,
    #            "level"=>@level,
    #            "number"=>i,
    #            "exercise_id"=>exer.id
    #        }
    #     @exer = Drawnexercise.create!(data)
    #     answer_data = {
    #          "teacher_id" => @gr.teacher_id,
    #          "student_id" => @student.id,
    #          "exercise_id" => exer.id,
    #          "reward" => exer.reward,
    #          "read" => false
    #        }
    #     if !Answer.exists?(:teacher_id => @gr.teacher_id, :student_id => session[:user_id], :exercise_id =>exer.id)
    #          answer = Answer.new(answer_data)
    #          answer.save
    #          @progr.total += answer.reward
    #          @progr.save
    #     end
    #  end
    #end
  end
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.where(teacher_id: Teacher.find_by(login: session[:login]).id)
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    
  end
  def show_exe #funkcja wyświetla wszystkie warianty danego zadania + formular_tworzenia zadania
    @exercise = Exercise.new
    @exercises = Exercise.where(teacher_id: session[:user_id],level: params[:lvl], number: params[:number])
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    teacher = Teacher.find(session[:user_id])
    @exercise = teacher.exercises.create(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to :back, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to show_exe_path(:lvl => params[:exercise][:level], :number => params[:exercise][:number]), notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:level, :number, :reward, :content, :hint)
    end
    def correct_teacher
      redirect_to root_url unless Teacher.find_by(login: current_user_login)
    end
    def logged_user
      redirect_to root_url unless logged_as_teacher? || logged_as_student?
    end
end
