class Product < ApplicationRecord
  validates :name, presence: true  
  validates :price, presence: true, numericality: true
  validates :store_id, presence: true 
   
  belongs_to :store
  has_and_belongs_to_many :labels, join_table: 'labels_products'
end
