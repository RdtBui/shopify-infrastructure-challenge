require 'test_helper'

class DeleteItemTest < ActionDispatch::IntegrationTest
  def setup
    @item = Item.create(title: 'Some title',
                        summary: 'Some summary',
                        sku: 'SOME-SKU-1',
                        brand: 'Some brand',
                        price: 1.23,
                        quantity: 5,
                        category: 'Some category')
  end

  test 'delete an item should succeed if exists' do
    assert_difference 'Item.count', -1 do
      delete item_url(@item)
    end

    assert_redirected_to items_path
  end
end
