class ChangeEndTimeTypeToDatetime < ActiveRecord::Migration[5.0]
  def change
  	change_column :events, :end, :datetime
  end
end
