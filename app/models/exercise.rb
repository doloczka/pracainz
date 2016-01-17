class Exercise < ActiveRecord::Base
  belongs_to :lesson
  has_one :teacher, :through => :lesson
end
