class DeleteStartFromEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :start
  end
end
