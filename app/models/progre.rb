class Progre < ActiveRecord::Base
  belongs_to :student
  
  def expe
    if self.total == 0
      return 0
    else
      self.gained_points.to_d/self.total.to_d
    end
  end
end
