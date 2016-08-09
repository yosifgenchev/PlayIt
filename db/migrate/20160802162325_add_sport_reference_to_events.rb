class AddSportReferenceToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_reference :events, :sport, foreign_key:true
  end
end
