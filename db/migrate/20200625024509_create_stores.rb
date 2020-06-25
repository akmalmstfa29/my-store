class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :phone_number
      t.string :description

      t.timestamps
    end
  end
end
