class SqanswersController < ApplicationController
  def show
    @sqanswer = Sqanswer.find(params[:id])
    @sq = Sidequest.find(@sqanswer.sidequest_id)
    @sqresult = Sqresult.new
  end
end
