class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  before_action :logged_user, only: [:index, :new, :destroy,:edit, :update, :create]
  
  # GET /wiadomoscis
  # GET /wiadomoscis.json
  def index
    if logged_as_student?
        @messages = Message.where(student_id: session[:user_id], direction: "0").order("created_at DESC")
    end
    if logged_as_teacher?
       @messages = Message.where(teacher_id: session[:user_id], direction: "1").order("created_at DESC")
    end
  end

  # GET /wiadomoscis/1
  # GET /wiadomoscis/1.json
  
  def show
    @message =Message.find(params[:id])
    @student = Student.find(@message.student_id)
    if logged_as_student? && @message.direction == 0
      @message.read = true
      @message.save
    end
    if logged_as_teacher? && @message.direction == 1
      @message.read = true
      @message.save
    end
  end

  # GET /wiadomoscis/new
  def new
    @message = Message.new
  end

  # GET /wiadomoscis/1/edit
  def edit
  end

  # POST /wiadomoscis
  # POST /wiadomoscis.json
  def create
     if logged_as_student?
        createstu
     end
     if logged_as_teacher?
        if params[:message][:id]!=nil
          createwy
        end
        if params[:message][:idgrupy]!=nil
          createwy2
        end
     end
  end
  
  
  
  
  # PATCH/PUT /wiadomoscis/1
  # PATCH/PUT /wiadomoscis/1.json
  def update
    respond_to do |format|
      if@message.update(wiadomosci_params)
        format.html { redirect_to@message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location:@message }
      else
        format.html { render :edit }
        format.json { render json:@message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiadomoscis/1
  # DELETE /wiadomoscis/1.json
  def destroy
   @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def createstu
    student=Student.find_by(id: session[:user_id])
    gr=Group.find_by(student.group_id)
   @message = Message.new(message_params)
   @message.student_id=session[:user_id]
   @message.teacher_id=gr.teacher_id
   @message.direction="1"
   @message.read= false
      respond_to do |format|
        if @message.save
          format.html { redirect_to@message, notice: 'Message was successfully created.' }
          format.json { render :index, status: :created, location:@message }
        else
          format.html { render :new }
          format.json { render json:@message.errors, status: :unprocessable_entity }
        end
      end
  end
    def createwy 
     @message = Message.new(message_params)
     @message.teacher_id=session[:user_id]
     @message.student_id=params[:message][:id]
     @message.direction="0"
     @message.read =false
        respond_to do |format|
          if @message.save
            format.html { redirect_to @message, notice: 'Message was successfully created.' }
            format.json { render :index, status: :created, location: @message }
          else
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
    end
    def createwy2 
     students=Student.where(group_id: params[:message][:idgrupy])
     students.each do |student|
      @message = Message.new(message_params)
      @message.teacher_id=session[:user_id]
      @message.student_id=student.id
      @message.direction="0"
      @message.read =false
      @message.save     
     end
        respond_to do |format|
          if @message.save
            format.html { redirect_to @message, notice: 'Message was successfully created.' }
            format.json { render :index, status: :created, location: @message }
          else
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:subject, :content)
    end
    def logged_user
      redirect_to root_url unless logged_as_student? || logged_as_teacher?
    end
    
end
