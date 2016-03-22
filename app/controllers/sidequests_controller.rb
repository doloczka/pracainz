class SidequestsController < ApplicationController
  before_action :set_sidequest, only: [:show, :edit, :update, :destroy]
  before_action :check_is_finished, only: :index
  before_action :correct_teacher, only: [:edit, :update, :create, :new, :destroy]
  before_action :logged_user, only: :index
  # GET /sidequests
  # GET /sidequests.json
  def index
    if logged_as_teacher?
      @sidequest= Sidequest.new
      @sidequests = Sidequest.where(teacher_id: session[:user_id])
    end
    if logged_as_student?
      student = Student.find(session[:user_id])
      progres = student.progre
      @sidequests = Sidequest.where(level: progres.lvl, finished: false)
    end
  end

  # GET /sidequests/1
  # GET /sidequests/1.json
  def show
    if logged_as_student?
      student = Student.find(session[:user_id])
      group = Group.find(student.group_id)
      if !Sqanswer.where(:teacher_id => group.teacher_id, :student_id => student.id, :sidequest_id => @sidequest.id, :reward => @sidequest.reward, :read => false).exists?
        @sqanswer = Sqanswer.new(:teacher_id => group.teacher_id, :student_id => student.id, :sidequest_id => @sidequest.id, :reward => @sidequest.reward, :read => false)
        @sqanswer.save
      else
        @sqanswer = Sqanswer.find_by(:student_id => student, :sidequest_id => @sidequest.id)
      end
    end
    
    if logged_as_teacher?
        @sidequest = Sidequest.find(params[:id])
        @sqanswers = Sqanswer.where(sidequest_id: @sidequest.id, read: false).sort_by{|e| e[:time]}.reverse 
    end
  end
  
  def sqanswer_update
    @sqanswer = Sqanswer.find(params[:sqanswer][:id])
    @sqanswer.update(:solution => params[:sqanswer][:solution])
    @sqanswer.save
    redirect_to student_path(session[:user_id])
  end
  
  # GET /sidequests/1/edit
  def edit
  end
  
  # POST /sidequests
  # POST /sidequests.json
  def create
    @sidequest = Sidequest.new(sidequest_params)

    respond_to do |format|
      if @sidequest.save
        format.html { redirect_to :back, notice: 'Sidequest was successfully created.' }
        format.json { render :back, status: :created, location: @sidequest }
      else
        format.html { render :new }
        format.json { render json: @sidequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidequests/1
  # PATCH/PUT /sidequests/1.json
  def update
    respond_to do |format|
      if @sidequest.update(sidequest_params)
        format.html { redirect_to @sidequest, notice: 'Sidequest was successfully updated.' }
        format.json { render :show, status: :ok, location: @sidequest }
      else
        format.html { render :edit }
        format.json { render json: @sidequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidequests/1
  # DELETE /sidequests/1.json
  def destroy
    @sidequest.destroy
    respond_to do |format|
      format.html { redirect_to sidequests_url, notice: 'Sidequest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidequest
      @sidequest = Sidequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidequest_params
      params.require(:sidequest).permit(:teacher_id, :level, :content, :reward, :finished, :finish)
    end
    def check_is_finished
      now = Time.now
      @sidequests = Sidequest.where(finished: false)
      @sidequests.each do |sq|
        sq.update_column(:finished, true)  if now.to_i > sq.finish.to_i
      end
    end
end
