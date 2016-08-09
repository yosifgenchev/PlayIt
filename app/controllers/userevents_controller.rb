class UsereventsController < ApplicationController
  def create
    @event = Event.find(params[:userevent][:attended_event_id])
    current_user.attend!(@event)
    redirect_to @event
  end

  def destroy
    @event = Userevent.find(params[:id]).attended_event
    current_user.cancel!(@event)
    redirect_to @event
  end
end
