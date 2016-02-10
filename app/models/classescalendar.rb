class Classescalendar < ActiveRecord::Base
  belongs_to :group
  before_update :validation
  
  private
   def validation
      if self.start.to_i > self.end.to_i
          self.end = self.start.to_i + 60*120
      end
   end
end
