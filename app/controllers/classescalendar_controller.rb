class ClassescalendarController < ApplicationController
    before_action :correct_teacher, :update
    def update
        params['clas'].keys.each do |id|
            @clas = Classescalendar.find(id.to_i)
            @clas.update_attributes(clas_params(id))
        end
        redirect_to :back
    end
    private
        def clas_params(id)
            params.require(:clas).fetch(id).permit( :start, :end )
        end
        def correct_teacher
            redirect_to :back unless logged_as_teacher?
        end
end
