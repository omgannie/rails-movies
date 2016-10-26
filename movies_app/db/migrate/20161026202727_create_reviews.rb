class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :movie_id, null: false
      t.integer :reviewer_id, null: false
      t.string  :body, null: false
      t.string  :title, null: false

      t.timestamps(null: false)
    end
  end
end
