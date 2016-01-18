class SidequestsController < ApplicationController
  before_action :set_sidequest, only: [:show, :edit, :update, :destroy]

  # GET /sidequests
  # GET /sidequests.json
  def index
    @sidequests = Sidequest.all
  end

  # GET /sidequests/1
  # GET /sidequests/1.json
  def show
  end

  # GET /sidequests/new
  def new
    @sidequest = Sidequest.new
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
        format.html { redirect_to @sidequest, notice: 'Sidequest was successfully created.' }
        format.json { render :show, status: :created, location: @sidequest }
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
      params.require(:sidequest).permit(:teacher_id, :level, :content, :challenger_id, :challenger_answer, :recipient, :recipient_answer)
    end
end
