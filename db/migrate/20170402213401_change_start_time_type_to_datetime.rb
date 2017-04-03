class ChangeStartTimeTypeToDatetime < ActiveRecord::Migration[5.0]
  def change
  	change_column :events, :start, :datetime
  end
end
