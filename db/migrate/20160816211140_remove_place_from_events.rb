class RemovePlaceFromEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :place
  end
end
