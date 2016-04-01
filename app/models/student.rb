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
  before_save :downcase_email
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, allow_nil:true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil:true 
  validates :album_number, :numericality => {:only_integer => true}
  def admit_medal(medal)
    awarded_medals.create(medal_id: medal)
    self.progre.points += Medal.find_by(id: medal).value
    self.progre.save
  end
  def take_medal(medal)
    awarded_medals.find_by(medal_id: medal).destroy
  end
  def has_medal?(medal)
    awarded_medals.exists?(medal_id: medal)
  end
  
    private
      def downcase_email
        if !self.email.nil?
          self.email = email.downcase
        end
      end
end
