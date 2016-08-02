class HomepageController < ApplicationController
  def home
  	 @events = []
  	 User.all.each do |user|
  	 	@events = @events + user.events
  	 end
  end
end
