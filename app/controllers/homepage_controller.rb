class HomepageController < ApplicationController
  def home
  	 @events = []
  	 User.all.each do |user|
  	 	@events = @events + user.events
  	 end

     @sorted_events = @events.sort_by(&:created_at).reverse
  end
end
