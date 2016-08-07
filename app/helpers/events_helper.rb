module EventsHelper
	# def attendees_needed_going_ratio
	# 	if (userevents.attended_event_id = event.id)
	# 		@users_attending = Userevents.count('attended_event_id')
	# 	end
	# 	@attendees_ratio = @users_attending / events.number_of_attendees_needed
	# end

	def attendees_ratio(event)
		#Userevent.find_by(attended_event_id: event.id).size
		#Userevent.count(:conditions => { :attended_event_id => event.id})
		@attendees_ratio = 0
		@userEventCount = Userevent.where(:attended_event_id => event.id ).count
		if !@userEventCount.nil?
			@attendees_ratio = (@userEventCount / event.number_of_attendees_needed.to_f) * 100
		end
	end
end
