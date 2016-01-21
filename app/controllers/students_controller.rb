class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end
 
  # GET /students/1
  # GET /students/1.json
  def show
  end


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
      if @student.save
        progrs = Progre.new(student_id: @student.id, points: 0, hp: 100, expe: 0, lvl: 1)
        progrs.save
        redirect_to :back
      else
        redirect_to :back
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
      @student = Student.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:login, :password, :email, :name, :lastname)
    end
    def new_student_params
      params.require(:student).permit(:album_number)
    end
end