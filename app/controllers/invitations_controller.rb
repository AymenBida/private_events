class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @invited_users = User.where("users.username != '#{current_user.username}'").pluck(:username, :id)
  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build(user_id: params[:invitation][:attendee_id])
    if @invitation.save
      redirect_to @event
    else
      render :new
    end
  end
end
