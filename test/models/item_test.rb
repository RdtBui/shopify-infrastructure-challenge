require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
  end

  # ========================================
  # | general item tests
  # ========================================
  test 'item should be valid' do
    assert @item.valid?
  end

  # ========================================
  # | title tests
  # ========================================
  test 'missing title should not be valid' do
    @item.title = nil
    assert_not @item.valid?
  end

  test 'title should be present' do
    @item.title = '                '
    assert_not @item.valid?
  end

  test 'title should not be too long' do
    @item.title = 'c' * 101
    assert_not @item.valid?
  end

  # ========================================
  # | summary tests
  # ========================================
  test 'summary should be optional' do
    @item.summary = nil
    assert @item.valid?
  end

  test 'summary should not be too long' do
    @item.summary = 'c' * 301
    assert_not @item.valid?
  end

  # ========================================
  # | sku tests
  # ========================================
  test 'sku should be unique' do
    @item.save
    @item2 = Item.new(title: 'Some other title',
                      summary: 'Some other summary',
                      sku: 'SOME-SKU', # Same SKU as @item
                      brand: 'Some other brand',
                      price: 1.23,
                      quantity: 5,
                      category: 'Some other category')

    assert_not @item2.valid?
  end

  test 'sku should be present' do
    @item.sku = '                '
    assert_not @item.valid?
  end

  test 'missing sku should not be valid' do
    @item.sku = nil
    assert_not @item.valid?
  end

  # ========================================
  # | brand tests
  # ========================================
  test 'brand should not be too long' do
    @item.brand = 'c' * 51
    assert_not @item.valid?
  end

  # ========================================
  # | price tests
  # ========================================
  test 'zero price should be valid' do
    @item.price = 0
    assert @item.valid?
  end

  test 'integer price should be valid' do
    @item.price = 5
    assert @item.valid?
  end

  test 'float price should be valid' do
    @item.price = 10.99
    assert @item.valid?
  end

  test 'price should not be negative' do
    @item.price = -1
    assert_not @item.valid?
  end

  test 'price should not contain alpha characters' do
    @item.price = 'six'
    assert_not @item.valid?
  end

  test 'price should not contain special characters' do
    @item.price = "!@\#$%^&"
    assert_not @item.valid?
  end

  # ========================================
  # | quantity tests
  # ========================================
  test 'zero quantity should be valid' do
    @item.quantity = 0
    assert @item.valid?
  end

  test 'integer quantity should be valid' do
    @item.quantity = 5
    assert @item.valid?
  end

  test 'float quantity should not be valid' do
    @item.quantity = 5.5
    assert_not @item.valid?
  end

  test 'quantity should not be negative' do
    @item.quantity = -1
    assert_not @item.valid?
  end

  test 'quantity should not contain alpha characters' do
    @item.quantity = 'five'
    assert_not @item.valid?
  end

  test 'quantity should not contain special characters' do
    @item.quantity = "!@\#$%^&"
    assert_not @item.valid?
  end

  # ========================================
  # | category tests
  # ========================================
  test 'category should not be too long' do
    @item.category = 'c' * 51
    assert_not @item.valid?
  end
end
