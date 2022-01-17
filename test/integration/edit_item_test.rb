require "test_helper"

class EditItemTest < ActionDispatch::IntegrationTest
    def setup
        @item = Item.create(title: 'Some title',
                            summary: 'Some summary',
                            sku: 'SOME-SKU-1',
                            brand: 'Some brand',
                            price: 1.23,
                            quantity: 5,
                            category: 'Some category' )                        
    end

    test "get edit form and change the quantity" do
        get "/items/#{@item.id}/edit"
        assert_response :success
        assert_no_difference 'Item.count' do
            patch item_url(@item), params: { item: { quantity: 200 }}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
        assert_match "<strong>Quantity:</strong>\n  200\n</p>\n\n<p>\n  <strong>", response.body
    end

    test "update quantity to negative should display error" do
        get "/items/#{@item.id}/edit"
        assert_response :success
        assert_no_difference 'Item.count' do
            patch item_url(@item), params: { item: { quantity: -1 }}
            assert_match "error", response.body
        end
    end
end