class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
  	@event = Event.new
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def show
  	@event = Event.find(params[:id])
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def create
  	@event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      render 'homepage/home'
    end
  end

  private

  def event_params
  	params.require(:event).permit(:name, 
  								 :description, 
  								 :sport_id, 
  								 :place_id,
  								 :number_of_attendees_needed)
  end

end
