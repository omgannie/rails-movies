class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string  :rateable_type, null: false
      t.integer :rateable_id, null: false
      t.integer :value, null: false

      t.timestamps(null: false)
    end
  end
end
