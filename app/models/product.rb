class Product < ApplicationRecord
  validates :name, presence: true  
  validates :price, presence: true, numericality: true
  validates :store_id, presence: true 
   
  belongs_to :store
end
