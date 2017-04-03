class AddEndTimeToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :end, :time
  end
end
