class SqanswersController < ApplicationController
  before_action :correct_teacher, only: :show
  def show
    @sqanswer = Sqanswer.find(params[:id])
    @sq = Sidequest.find(@sqanswer.sidequest_id)
    @sqresult = Sqresult.new
  end
end
