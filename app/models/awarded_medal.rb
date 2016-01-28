class AwardedMedal < ActiveRecord::Base
    belongs_to :student
    belongs_to :medal
    validates :student_id, presence: true
    validates :medal_id, presence: true
end
