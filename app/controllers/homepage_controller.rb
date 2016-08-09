class HomepageController < ApplicationController
  def home
  	 @events = []
  	 User.all.each do |user|
  	 	@events = @events + user.events
  	 end

  	 @basketballEvents = []
  	 @events.each do |event|
  	 	@basketballEvents << event if event.sport.name == 'Basketball'
  	 end

  end
end
