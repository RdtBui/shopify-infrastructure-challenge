require "test_helper"

class ReportTest < ActiveSupport::TestCase
  def setup 
    @log = Log.new(item_title: "Some title",
                   item_sku: "Some sku",
                   item_price: 1,
                   item_quantity: 1,
                   item_brand: "Some brand",
                   item_category: "Some category")
      
    @log2 = Log.new(item_title: "Some title 2",
                   item_sku: "Some sku 2",
                   item_price: 1,
                   item_quantity: 1,
                   item_brand: "Some brand 2",
                   item_category: "Some category 2")

    @log3 = Log.new(item_title: "Some title 3",
                    item_sku: "Some sku 3",
                    item_price: 1,
                    item_quantity: 1,
                    item_brand: "Some brand 2",
                    item_category: "Some category")

    @log3 = Log.new(item_title: "Some title 4",
                    item_sku: "Some sku 4",
                    item_price: 1,
                    item_quantity: 1,
                    item_brand: "Some brand 3",
                    item_category: "Some category 2")
  end


  # generate_inventory_report tests
  # test "title should be present" do
  #   @item.title = "                "
  #   assert_not @item.valid?
  # end

  # generate_monthly_report tests
  # max_quantity tests
  # max_revenue tests
  # max_average_quantity_by_brand tests
  # max_average_quantity_by_category tests
  # min_quantity tests
  # min_revenue tests
  # min_average_quantity_by_brand tests
  # min_average_quantity_by_category tests
  # get_month_log tests
  # min_max_quantity tests
  # min_max_revenue tests
  # min_max_average_quantity_by_criteria tests
  
  # test "boop" do
  #   @item = {}
  #   assert_not @item.valid?
  # end

end