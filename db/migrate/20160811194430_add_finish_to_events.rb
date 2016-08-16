class AddFinishToEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :end
  	add_column :events, :finish, :datetime
  end
end
