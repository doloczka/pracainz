class Teacher < ActiveRecord::Base
    has_many :groups
    has_many :students, through: :groups
    has_many :exercises
    has_secure_password
    before_save :downcase_email
    validates :name, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 2 }, allow_nil:true
    
    private
    
      def downcase_email
        self.email = email.downcase if !self.email.nil?
      end

end
