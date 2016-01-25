class Student < ActiveRecord::Base
  belongs_to :group
  has_one :teacher, through: :group
  has_many :presences, dependent: :destroy
  has_one :progre, dependent: :destroy
  has_many :drawnexercises, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_secure_password
end
