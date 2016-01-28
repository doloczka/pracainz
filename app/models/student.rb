class Student < ActiveRecord::Base
  belongs_to :group
  has_one :teacher, through: :group
  has_many :presences, dependent: :destroy
  has_one :progre, dependent: :destroy
  has_many :drawnexercises, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :awarded_medals, dependent: :destroy
  has_secure_password
  
  def admit_medal(medal)
    awarded_medals.create(medal_id: medal)
  end
  def take_medal(medal)
    awarded_medals.find_by(medal_id: medal).destroy
  end
  def has_medal?(medal)
    awarded_medals.exists?(medal_id: medal)
  end
end
