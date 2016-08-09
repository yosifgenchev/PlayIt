class AddNumberOfAttendeesNeededToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :number_of_attendees_needed, :integer
  end
end
