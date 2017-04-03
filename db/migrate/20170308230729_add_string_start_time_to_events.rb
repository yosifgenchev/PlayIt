class AddStringStartTimeToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :start_time, :string
  end
end
