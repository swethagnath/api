class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :restaurant_id
      t.text :review_body
      t.integer :user_id

      t.timestamps
    end
  end
end
