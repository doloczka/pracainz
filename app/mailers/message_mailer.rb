class MessageMailer < ApplicationMailer
    default from: "Your Mailer kontakt.form.game.school@gmail.com"
    default to: "doloczka@gmail.com"

  def new_message(my_mail)
        @my_mail = my_mail
    
    mail subject: "#{my_mail.name} Zgłoszenie błędu"
  end
end
