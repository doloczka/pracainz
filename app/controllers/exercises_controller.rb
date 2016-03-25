class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :correct_teacher, only: [:index, :show_exe, :destroy, :edit, :create, :new, :destroy]
  before_action :logged_user, only: [:show, :update,:lesson]
  
  def lesson
    @level = params[:level]
    @student = Student.find_by(login: session[:login])
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
       lvl = params[:lvl].to_i
    number = params[:number].to_i
    @exercise = Exercise.new
    @exercises = Exercise.where(teacher_id: session[:user_id],level: params[:lvl], number: params[:number])
    @story = Story.find_by(level: lvl, number: number)

    if number==1
          @nextlvl = lvl
          @prevlvl = lvl==1 ? 6 : lvl-1
          @nextnumber = number + 1
          @prevnumber = 5
    elsif number == 5
          @nextlvl = lvl==6 ? 1 : lvl+1
          @prevlvl = lvl
          @nextnumber = 1
          @prevnumber = number -1
    else
          @nextlvl = lvl
          @prevlvl = lvl
          @nextnumber = number+1
          @prevnumber = number-1
    end

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
      params.require(:exercise).permit(:level, :number, :reward, :content, :hint, :variant)
    end
    def correct_teacher
      redirect_to root_url unless Teacher.find_by(login: current_user_login)
    end

end
