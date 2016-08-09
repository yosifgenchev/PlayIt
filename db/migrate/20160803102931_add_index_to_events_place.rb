class AddIndexToEventsPlace < ActiveRecord::Migration[5.0]
  def change
  	add_index :events, [:place_id, :created_at]
  end
end
