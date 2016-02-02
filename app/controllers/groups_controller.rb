class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :correct_teacher, only: [:index, :show, :edit, :update, :destroy]
  # GET /groups
  # GET /groups.json
  def index
    teacher = Teacher.find(curent_user_id)
    @group= teacher.groups.build
    @groups = Group.where(teacher_id: params[:teacher_id])
    @students = Student.joins(:progre).order('points DESC').where(group_id: @groups) #Student.where(group_id:  @groups, :joins => :progre, :order => 'progre.points')
    @lp=0
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @student = @group.students.build
    @students = Student.joins(:progre).order('points DESC').where(group_id: params[:id])
    @classes = Classescalendar.where(group_id: params[:id])
    @nr=0
  end


  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    teacher = Teacher.find(curent_user_id)
    @group = teacher.groups.create(group_params)
    6.times do |class_nr|
      meeting_date_start = Time.now + (7.days * class_nr)
      meeting_date_end = meeting_date_start + (120+15)*60 # 1,5h w sekundach
      meeting = Classescalendar.new(group_id: @group.id, classes_number: class_nr+=1,start: meeting_date_start, end: meeting_date_end)
      meeting.save
    end
    respond_to do |format|
      if @group.save
        format.html { redirect_to teacher_groups_path(session[:user_id]), notice: 'Group was successfully created.' }
        format.json { render :index, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to teacher_groups_path(session[:user_id]), notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :date, :teacher_id)
    end
    def correct_teacher
      if !params[:id].nil? 
        set_group
        redirect_to :back unless Teacher.find(@group.teacher_id) == Teacher.find_by(login: session[:login])
      else
        redirect_to root_url unless logged_as_teacher?
      end
    end
    
end
