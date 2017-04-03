class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :show]

  def new
  	@event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
    
    @hash = Gmaps4rails.build_markers(@event) do |e, marker|
      marker.lat e.place.lat
      marker.lng e.place.lng
    end
  end

  def create
  	@event = current_user.events.build(event_params)
    if @event.save
      current_user.attend!(@event)
      flash[:success] = "Event created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
  	params.require(:event).permit(:title, 
  								                :description, 
  								                :sport_id, 
  								                :place_id,
  								                :number_of_attendees_needed,
                                  :date,
                                  :start,
                                  :end)
  end

end
