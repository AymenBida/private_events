class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @event = Event.find(params[:event_id])
    @attendees = @event.invitations.joins(:attendee).pluck(:username)
    @invited_users = User.where.not(username: current_user.username)
      .where.not(username: @attendees).pluck(:username, :id)
  end

  def attend
    @event = Event.find(params[:event_id])
    
    @invitation = @event.invitations.build(user_id: current_user.id)
    if @invitation.save
      flash[:success] = "You are attending this event: #{@event.event_name}!"
      redirect_to current_user
    else
      redirect_to events_path
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build(user_id: params[:invitation][:attendee_id])
    @invited_user = User.find(params[:invitation][:attendee_id])
    if @invitation.save
      flash[:success] = "You successfuly invited #{@invited_user.username} !"
      redirect_to @event
    else
      render :new
    end
  end
end
