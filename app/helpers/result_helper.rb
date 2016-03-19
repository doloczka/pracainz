module ResultHelper
    
 def give_a_medal_and_send_message(medal, student)
      student.admit_medal(medal)
      medal = Medal.find(medal)
      Message.create!(teacher_id: session[:user_id], student_id: student.id, subject: "Dostałeś nagrodę specjalną !", content: "Właśnie otrzymałeś #{medal.description} !", direction: 0)
 end
end
