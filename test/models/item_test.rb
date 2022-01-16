require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup 
    @item = Item.new(title: "Some title", 
                     summary: "Some summary", 
                     sku: "SOME-SKU",
                     brand: "Some brand",
                     price: 1.23,
                     quantity: 5,
                     category: "Some category" )
  end

  test "item should be valid" do
    assert @item.valid?
  end

  test "missing title should not be valid" do
    @item.title = nil
    assert_not @item.valid?
  end

  test "title should be present" do
    @item.title = "                "
    assert_not @item.valid?
  end

  test "title should not be too long" do
    @item.title = 'c' * 101
    assert_not @item.valid?
  end

end
