class DropSportIdFromEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :sport_id
  end
end
