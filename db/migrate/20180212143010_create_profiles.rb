class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :app_handle
      t.string :foodie_level
      t.integer :user_id

      t.timestamps
    end
  end
end
