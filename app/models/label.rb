class Label < ApplicationRecord
    validates :name, presence: true  
    has_and_belongs_to_many :products, :dependent => :delete_all
end
