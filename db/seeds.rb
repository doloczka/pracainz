Teacher.create!(    name: 'Wy1Im', 
                   lastname: 'Wy1Naz', 
                   login: "wy", 
                   password_digest: BCrypt::Password.create("wy"), 
                   email: 'wy1@example.com')
Student.create!(login: "st", 
                password_digest: BCrypt::Password.create("st"), 
                email: "st@exam.com", 
                name: "St1Im", 
                lastname: "StNAz", 
                album_number: "111", 
                group_id: "1"
                )

6.times do |lvl=1|
    5.times do |nr=1|
                Exercise.create!(teacher_id: 1,
                 level: lvl,
                 number: nr,
                 reward: 10,
                 content: "Treść Zajęcia #{lvl}, ćwiczenie nr: #{nr}.",
                 hint: "Hint Zajęcia #{lvl}, ćwiczenie nr: #{nr}."
                 )
    end
end
5.times do |n| 
    Sidequest.create!(teacher_id: 1,
                      level: n,
                      content: "content zadania pobocznego #{n+=1}",
                      challenger_id: 1,
                      challenger_answer: "odpowiedz wyzywajacego",
                      recipient_id: 2,
                      recipient_answer: "odpowiedz wyzywanego"
                      )
end

Group.create!(teacher_id: 1,
            name: "grupa testowa"    
            )
Message.create!(subject: "temat",
                content: "content",
                read: false,
                direction: 0,
                student_id: 1,
                teacher_id: 1 )
Message.create!(subject: "temat",
                content: "content",
                read: false,
                direction: 1,
                student_id: 1,
                teacher_id: 1 )
Group.create!(teacher_id: "1",
                name: "sroda 9:40")
                
Progre.create!( student_id: "1", 
                points: "30", 
                hp: "100", 
                expe: "50", 
                lvl: "1")
Answer.create!(teacher_id: "1",
                    student_id: "1",
                    read: "0")
Classescalendar.create!(group_id: "1", classes_number: "1", start: "2016-01-19 06:00:00" , end: "2016-01-19 12:00:00" )
Classescalendar.create!(group_id: "1", classes_number: "2", start: "2016-01-20 06:00:00" , end: "2016-01-20 12:00:00" )
Classescalendar.create!(group_id: "1", classes_number: "3", start: "2016-01-21 06:00:00" , end: "2016-01-21 12:00:00" )
Classescalendar.create!(group_id: "1", classes_number: "4", start: "2016-01-22 06:00:00" , end: "2016-01-22 12:00:00" )
Classescalendar.create!(group_id: "1", classes_number: "5", start: "2016-01-23 06:00:00" , end: "2016-01-23 12:00:00" )
<<<<<<< HEAD
=======

Exercise.create!(teacher_id: "1",
                    level: "1",
                    number: "1",
                    reward: "10",
                    content: "zadanie pierwsze dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "1",
                    number: "2",
                    reward: "10",
                    content: "zadanie drugie dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "1",
                    number: "3",
                    reward: "10",
                    content: "zadanie trzecie dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "1",
                    number: "4",
                    reward: "10",
                    content: "zadanie czwarte dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "1",
                    number: "5",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
                    
     #zadania na kolejne dni+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Exercise.create!(teacher_id: "1",
                    level: "2",
                    number: "1",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "2",
                    number: "2",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
					
Exercise.create!(teacher_id: "1",
                    level: "2",
                    number: "3",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "2",
                    number: "4",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "2",
                    number: "5",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )

					
Exercise.create!(teacher_id: "1",
                    level: "3",
                    number: "1",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "3",
                    number: "2",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "3",
                    number: "3",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "3",
                    number: "4",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "3",
                    number: "5",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )

Exercise.create!(teacher_id: "1",
                    level: "4",
                    number: "1",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "4",
                    number: "2",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "4",
                    number: "3",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "4",
                    number: "4",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "4",
                    number: "5",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )

Exercise.create!(teacher_id: "1",
                    level: "5",
                    number: "1",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "5",
                    number: "2",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "5",
                    number: "3",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "5",
                    number: "4",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
Exercise.create!(teacher_id: "1",
                    level: "5",
                    number: "5",
                    reward: "10",
                    content: "zadanie piate dzien pierwszy"
                    )
>>>>>>> kopiowanie
