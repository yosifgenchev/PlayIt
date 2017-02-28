class HomepageController < ApplicationController
  def home
  	 @events = []
  	 User.all.each do |user|
  	 	@events = @events + user.events
  	 end

     @sorted_events = @events.sort_by(&:created_at).reverse

     #Do not delete! This could be used as a prototype.
  	 #@basketballEvents = []
  	 #@events.each do |event|
  	 #	@basketballEvents << event if event.sport.name == 'Basketball'
  	 #end

  end
end
