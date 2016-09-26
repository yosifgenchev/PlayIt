module EventsHelper
	def attendees_ratio(event)
		@attendees_ratio = 0
		@userEventCount = Userevent.where(:attended_event_id => event.id ).count
		if !@userEventCount.nil?
			@attendees_ratio = (@userEventCount / event.number_of_attendees_needed.to_f) * 100
		end
	end
end
