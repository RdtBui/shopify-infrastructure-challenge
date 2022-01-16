class Item < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 100 }
    validates :summary, length: { maximum: 300 }
    validates :sku, presence: true
    # validates :sku, presence: true, uniqueness: { scope: :brand, message: "should be unique within the same brand" }
    validates :brand, length: { maximum: 50 }
    validates :price, presence: true, numericality: { only_float: true, :greater_than_or_equal_to => 0 }
    validates :quantity, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }    
end
