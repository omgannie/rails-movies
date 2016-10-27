class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :review_id, null: false
      t.integer  :author_id, null: false
      t.string  :body, null: false

      t.timestamps(null: false)
    end
  end
end
