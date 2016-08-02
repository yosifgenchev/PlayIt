class RemoveEventIdColumnFromSports < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sports, :event_id
  end
end
