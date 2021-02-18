class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)
    puts event_params
    if @event.save
      
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :location, :time, :user_id)
  end
end
