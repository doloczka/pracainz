class Lesson < ActiveRecord::Base
  belongs_to :teacher
  has_many :exercises
end
