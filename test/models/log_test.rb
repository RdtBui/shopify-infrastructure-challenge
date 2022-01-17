require "test_helper"

# Note: Very similar tests to item because log is essentially a snapshot of item at a given time.
class LogTest < ActiveSupport::TestCase
  def setup 
    @log = Log.new(item_title: "Some title", 
                   item_sku: "SOME-SKU",
                   item_brand: "Some brand",
                   item_price: 1.23,
                   item_quantity: 5,
                   item_category: "Some category")
  end

  # ========================================
  # | general log tests 
  # ========================================
  test "log should be valid" do
    assert @log.valid?
  end

  # ========================================
  # | item_title tests 
  # ========================================
  test "missing title should not be valid" do
    @log.item_title = nil
    assert_not @log.valid?
  end

  test "title should be present" do
    @log.item_title = "                "
    assert_not @log.valid?
  end

  test "title should not be too long" do
    @log.item_title = 'c' * 101
    assert_not @log.valid?
  end

  # ========================================
  # | item_sku tests 
  # ========================================
  test "item_sku should be present" do
    @log.item_sku = "                "
    assert_not @log.valid?
  end

  test "missing item_sku should not be valid" do
    @log.item_sku = nil
    assert_not @log.valid?
  end

  # ========================================
  # | item_brand tests 
  # ========================================
  test "item_brand should not be too long" do
    @log.item_brand = 'c' * 51

    assert_not @log.valid?
  end

  # ========================================
  # | item_price tests 
  # ========================================
  test "zero item_price should be valid" do
    @log.item_price = 0
    assert @log.valid?
  end

  test "integer item_price should be valid" do
    @log.item_price = 5
    assert @log.valid?
  end

  test "float price should be valid" do
    @log.item_price = 10.99
    assert @log.valid?
  end

  test "item_price should not be negative" do
    @log.item_price = -1
    assert_not @log.valid?
  end

  test "item_price should not contain alpha characters" do
    @log.item_price = "six"
    assert_not @log.valid?
  end

  test "item_price should not contain special characters" do
    @log.item_price = "!@#$%^&"
    assert_not @log.valid?
  end

  # ========================================
  # | item_quantity tests 
  # ========================================
  test "zero item_quantity should be valid" do
    @log.item_quantity = 0
    assert @log.valid?
  end

  test "integer item_quantity should be valid" do
    @log.item_quantity = 5
    assert @log.valid?
  end

  test "float item_quantity should not be valid" do
    @log.item_quantity = 5.5
    assert_not @log.valid?
  end

  test "item_quantity should not be negative" do
    @log.item_quantity = -1
    assert_not @log.valid?
  end

  test "item_quantity should not contain alpha characters" do
    @log.item_quantity = "five"
    assert_not @log.valid?
  end

  test "item_quantity should not contain special characters" do
    @log.item_quantity = "!@#$%^&"
    assert_not @log.valid?
  end

  # ========================================
  # | item_category tests 
  # ========================================
  test "item_category should not be too long" do
    @log.item_category = 'c' * 51
    assert_not @log.valid?
  end
end
