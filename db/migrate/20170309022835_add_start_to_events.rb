class AddStartToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :start, :string
  end
end
