module ResultHelper
    
 def give_a_medal_and_send_message(medal_id, student)
      student.admit_medal(medal_id) unless student.has_medal?(medal_id)
      m = Medal.find(medal_id)
      Message.create!(teacher_id: session[:user_id], student_id: student.id, subject: "Dostałeś nagrodę specjalną !", content: "Właśnie otrzymałeś #{m.description} !", direction: 0,read: false)
 end
end
