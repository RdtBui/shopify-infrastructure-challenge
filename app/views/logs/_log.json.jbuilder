json.extract! log, :id, :item_title, :item_sku, :item_price, :item_quantity, :item_brand, :item_category, :created_at,
              :updated_at
json.url log_url(log, format: :json)
