class AddSportIdToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :sport_id, :integer
  end
end
