class Teacher < ActiveRecord::Base
    has_many :groups
    has_many :students, through: :groups
    has_many :exercises
    has_secure_password
end
