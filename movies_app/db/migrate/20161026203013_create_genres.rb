class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.integer :movie_id, null: false
      t.integer :category_id, null: false

      t.timestamps(null: false)
    end
  end
end
