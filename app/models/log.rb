class Log < ApplicationRecord
  validates :item_title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :item_sku, presence: true
  validates :item_brand, length: { maximum: 50 }
  validates :item_price, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :item_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :item_category, length: { maximum: 50 }
end
