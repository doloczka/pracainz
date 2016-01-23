class PresenceController < ApplicationController
  
  def update
    params['presence'].keys do |id|
      @presence = Presence.find(id.to_i)
      @presence.update_attributes(presence_params(id))
    end
    redirect_to :back
  end
  private
  
    def presence_params(id)
      params.require(:presence).fetch(id).permit(:present)
    end
end
