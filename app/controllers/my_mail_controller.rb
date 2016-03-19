class MyMailController < ApplicationController
  def new
    @my_mail = MyMail.new
  end

  def create
    @my_mail = MyMail.new(my_mail_params)
    
    if @my_mail.valid?
      MessageMailer.new_message(@my_mail).deliver_now
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def my_mail_params
    params.require(:my_mail).permit(:name, :email, :content)
  end
end
