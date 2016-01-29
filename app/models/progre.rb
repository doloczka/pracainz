class Progre < ActiveRecord::Base
  belongs_to :student
  
  def expe
    if self.total == 0
      return 0
    else
      self.gained_points/self.total
    end
  end
end
