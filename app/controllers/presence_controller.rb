class PresenceController < ApplicationController
  
  def update
    params['presence'].keys.each do |id|
      @presence = Presence.find(id)
      @presence.update_attributes(params.require(:presence).fetch(id).permit(:present))
    end
    redirect_to :back
  end
end
