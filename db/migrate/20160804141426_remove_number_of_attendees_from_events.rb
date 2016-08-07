class RemoveNumberOfAttendeesFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :number_of_attendees, :integer
  end
end
