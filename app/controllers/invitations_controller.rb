class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @invited_users = User.where("users.username != '#{current_user.username}'").pluck(:username, :id)
  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build(attendee_id: params[:invitation][:attendee_id], host_id: current_user.id)
    p params[:attendee_id]
    p current_user
    if @invitation.save
      puts 'SUCCCCCCCCESS'
    else
      puts 'FAILLLLURE'
    end
  end
end
