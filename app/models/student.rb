class Student < ActiveRecord::Base
  belongs_to :group
  has_one :teacher, :through => :group
  has_secure_password
 def Student.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
 end
end
