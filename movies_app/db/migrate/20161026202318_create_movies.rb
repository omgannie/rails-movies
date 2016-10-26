class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string  :title, null: false
      t.string  :cast, null: false
      t.string  :synopsis, null: false
      t.string  :poster_url
      t.datetime  :release_date, null: false

      t.timestamps(null: false)
    end
  end
end
