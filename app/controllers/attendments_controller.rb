class AttendmentsController < ApplicationController

  def new

    uninvitableUsers = Event.find(session[:event_id]).attendees.ids
    uninvitableUsers.push(session[:user_id])

    @attendment = Attendment.new
    @users = User.where.not( id: [uninvitableUsers])
                             

  end

  def create

    attendment = Attendment.new(attendment_params)
    attendment.event_id = session[:event_id]
    attendment.status = 'pending'
    attendment.save
    redirect_to event_path(session[:event_id])
    
  end

  private

    def attendment_params
      params.require(:attendment).permit( :user_id, :invitation_text)
    end

end
