class Answer < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
  has_one :group, through: :student
end
