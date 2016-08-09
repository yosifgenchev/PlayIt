class AddNumberOfAttendeesToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :number_of_attendees, :integer
  end
end
