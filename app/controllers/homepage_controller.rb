class HomepageController < ApplicationController
  def home
  	 @events = []
  	 User.all.each do |user|
  	 	@events = @events + user.events
  	 end

     #Do not delete! This could be used as a prototype.
  	 #@basketballEvents = []
  	 #@events.each do |event|
  	 #	@basketballEvents << event if event.sport.name == 'Basketball'
  	 #end

     if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
     

  end
end
