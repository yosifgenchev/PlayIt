class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
