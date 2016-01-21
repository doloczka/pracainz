class ResultController < ApplicationController
    
    def create
        @result = Result.new
    end
    
end
