json.extract! item, :id, :title, :summary, :sku, :price, :quantity, :category, :created_at, :updated_at
json.url item_url(item, format: :json)
