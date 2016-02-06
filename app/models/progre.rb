class Progre < ActiveRecord::Base
  belongs_to :student
  
  def expe
    if self.total == 0
      return 0
    else
      self.gained_points.to_d/self.total.to_d
    end
  end
  
  def place_group_ranking
    students_in_group = self.student.group.students.joins(:progre).order('points DESC')
    i=0
    students_in_group.each do |student|
      i+=1
      return i if student == self.student
    end
  end
  
  def place_world_ranking
    students = Student.all.joins(:progre).order('points DESC')
    i=0
    students.each do |student|
      i+=1
      return i if student == self.student
    end
  end
end
