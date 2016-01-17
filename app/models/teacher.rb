class Teacher < ActiveRecord::Base
    has_many :groups
    has_many :students, :through => :groups
    has_many :lessons
    has_many :exercises, :through => :lessons
    has_secure_password
 
 def Teacher.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
 end
end
