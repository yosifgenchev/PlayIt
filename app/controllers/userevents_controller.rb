class UsereventsController < ApplicationController
  def create
    @event = Event.find(params[:userevent][:attended_event_id])
    current_user.attend!(@event)
    redirect_to @event
  end

  def destroy
    @event = Userevent.find(params[:id]).attended_event
    @host = Userevent.find(params[:id]).attended_event.user

    if (current_user != @host)
      current_user.cancel!(@event)
      redirect_to @event
    else
      current_user.destroyEvent!(@event)
      redirect_to root_url
    end
  end
end
