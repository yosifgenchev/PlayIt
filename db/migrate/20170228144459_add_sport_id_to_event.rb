class AddSportIdToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :sports_id, :integer
  end
end
