module ResultHelper
    
 def give_a_medal(medal, student)
    if !student.has_medal?(medal) # przyzna medal jeśli został wybrany w comboxie i jeśli student jeszcze takiego nie posiada.
      student.admit_medal(medal.id)
      Message.create!(teacher_id: session[:user_id], student_id: student.id, subject: "Dostałeś nagrodę specjalną !", content: "Właśnie otrzymałeś #{medal.description} !", direction: 0)
    end
 end
end
