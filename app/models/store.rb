class Store < ApplicationRecord
    validates :name, presence: true
    validates :phone_number, presence: true
    
    has_many :products, :dependent => :delete_all
end
