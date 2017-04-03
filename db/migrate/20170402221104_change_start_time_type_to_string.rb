class ChangeStartTimeTypeToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :events, :start, :string
  end
end
