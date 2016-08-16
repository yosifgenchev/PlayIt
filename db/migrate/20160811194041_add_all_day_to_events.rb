class AddAllDayToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :all_day, :boolean, default: false
  end
end
