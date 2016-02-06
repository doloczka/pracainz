class PresenceController < ApplicationController
  before_action :correct_teacher, :update
  def update
    params['presence'].keys.each do |id|
      @presence = Presence.find(id)
      @presence.update_attributes(params.require(:presence).fetch(id).permit(:present))
      if !@presence.present
        @presence.student.progre.hp -=20
        @presence.student.progre.save
      end
    end
    redirect_to :back
  end

end
