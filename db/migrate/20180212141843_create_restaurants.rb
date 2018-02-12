class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :locality_id
      t.integer :city_id
      t.boolean :is_featured

      t.timestamps
    end
  end
end
