class Sqanswer < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
  belongs_to :sidequest
  
  def time
    self.updated_at.to_i - self.created_at.to_i
  end
end
