class Progre < ActiveRecord::Base
  belongs_to :student
  before_update :zerohp
  def expe
    if self.total == 0
      return 0
    else
      self.gained_points.to_d/self.total.to_d
    end
  end
  
  private
      def zerohp
        if self.hp<=0
          self.hp=40
          self.points=self.points*0.75
         # st=Student.finde_by(id: session[:user_id])
          Message.create!(subject: "System",
                content: "Zginąłeś. Kontunułujesz grę tracąc 1/4 wszystkich punktów.",
                read: false,
                direction: 0,
                student_id: self.id
               )
        end
      end
end
