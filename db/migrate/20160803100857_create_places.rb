class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.string :type

      t.timestamps
    end
  end
end
