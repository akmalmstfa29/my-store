class CreateJoinTableProductsLabels < ActiveRecord::Migration[6.0]
  def change
    create_join_table :products, :labels do |t|
      # t.index [:product_id, :label_id]
      # t.index [:label_id, :product_id]
    end
  end
end
