class DeleteNameFromEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :name
  end
end
