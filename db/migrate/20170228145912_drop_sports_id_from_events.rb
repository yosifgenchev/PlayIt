class DropSportsIdFromEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :sports_id
  end
end
