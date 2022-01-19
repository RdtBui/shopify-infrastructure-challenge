require 'test_helper'

class CreateItemTest < ActionDispatch::IntegrationTest
  test 'get add item form and create item' do
    get '/items/new'
    assert_response :success
    assert_difference 'Item.count', 1 do
      post items_path, params: { item: { title: 'Some title',
                                         summary: 'Some summary',
                                         sku: 'SOME-SKU-1',
                                         brand: 'Some brand',
                                         price: 1.23,
                                         quantity: 5,
                                         category: 'Some category' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'SOME-SKU', response.body
  end

  test 'get add item form and reject invalid item submission' do
    get '/items/new'
    assert_response :success
    assert_no_difference 'Item.count' do
      post items_path, params: { item: { title: 'Some title',
                                         summary: 'Some summary',
                                         sku: '',
                                         brand: 'Some brand',
                                         price: 1.23,
                                         quantity: 5,
                                         category: 'Some category' } }
    end
    assert_match 'errors', response.body
  end
end
