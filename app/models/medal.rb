class Medal < ActiveRecord::Base
  has_many :awarded_medals
end
