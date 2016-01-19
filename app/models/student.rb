class Student < ActiveRecord::Base
  belongs_to :group
  has_one :teacher, through: :group
  has_secure_password
end
