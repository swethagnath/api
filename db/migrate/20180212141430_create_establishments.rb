class CreateEstablishments < ActiveRecord::Migration[5.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.timestamps
    end
  end
end
