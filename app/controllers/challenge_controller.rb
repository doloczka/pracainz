class ChallengeController < ApplicationController
    
    def index
        @challenges = Sidequest.where(status: 1,teacher_id: session[:user_id])
    end
    
    def win
        
    end
    
    def draw
    end
end
