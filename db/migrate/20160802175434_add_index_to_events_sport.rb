class AddIndexToEventsSport < ActiveRecord::Migration[5.0]
  def change
  	add_index :events, [:sport_id, :created_at]
  end
end
