class EventsController < ApplicationController
  def index
    @future_events = Event.all.future_events
    @past_events = Event.all.past_events
  end

  def new
    @event = current_user.events.build
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.invitations.joins(:attendee).pluck(:username)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = 'Event successfully updated'
      redirect_to @event
    else
      render :edit
    end
  end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)
    puts event_params
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to @event
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    flash[:success] = 'Event successfully deleted'
    redirect_to @event.user
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :location, :time, :user_id)
  end
end
