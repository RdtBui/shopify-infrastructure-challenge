require "test_helper"
require "date"

class ReportTest < ActiveSupport::TestCase
  def setup 
    @log = Log.create(item_title: "Some title 1",
      item_sku: "Some sku 1",
      item_price: 5,
      item_quantity: 10,
      item_brand: "Some brand 1",
      item_category: "Some category",
      created_at: DateTime.new(2021,2,10))

    @log2 = Log.create(item_title: "Some title 2",
      item_sku: "Some sku 2",
      item_price: 2,
      item_quantity: 20,
      item_brand: "Some brand 2",
      item_category: "Some category 2",
      created_at: DateTime.new(2021,2,20))

    @log3 = Log.create(item_title: "Some title 2",
      item_sku: "Some sku 2",
      item_price: 8,
      item_quantity: 23,
      item_brand: "Some brand 2",
      item_category: "Some category 2",
      created_at: DateTime.new(2021,4,20))

    @log4 = Log.create(item_title: "Some title 4",
      item_sku: "Some sku 4",
      item_price: 2.32,
      item_quantity: 88,
      item_brand: "Some brand 3",
      item_category: "Some category 2",
      created_at: DateTime.new(2021,4,20))

    @log5 = Log.create(item_title: "Some title 5",
      item_sku: "Some sku 5",
      item_price: 6.42,
      item_quantity: 34,
      item_brand: "Some brand 4",
      item_category: "Some category 3",
      created_at: DateTime.new(2021,6,20))

    @log6 = Log.create(item_title: "Some title 6",
      item_sku: "Some sku 6",
      item_price: 43,
      item_quantity: 230,
      item_brand: "Some brand 4",
      item_category: "Some category 3",
      created_at: DateTime.new(2021,12,20))
  end

  # ========================================
  # | generate_month_report method tests 
  # ========================================

  test "months containing logs should return valid results" do
    report = Report.new
    result = report.generate_month_report(2021, 2)

    max_quantity_log = result[:max_quantity_log]
    assert_equal @log2, max_quantity_log

    max_revenue_log = result[:max_revenue_log]
    assert_equal @log, max_revenue_log

    max_average_quantity_by_brand = result[:max_average_quantity_by_brand]
    key, value = max_average_quantity_by_brand
    assert @log2.item_brand, key
    assert @log2.item_quantity, value

    max_average_quantity_by_category = result[:max_average_quantity_by_category]
    key, value = max_average_quantity_by_category
    assert @log2.item_category, key
    assert @log2.item_quantity, value

    min_quantity_log = result[:min_quantity_log]
    assert_equal @log, min_quantity_log

    min_revenue_log = result[:min_revenue_log]
    assert_equal @log2, min_revenue_log

    min_average_quantity_by_brand = result[:min_average_quantity_by_brand]
    key, value = min_average_quantity_by_brand
    assert @log.item_brand, key
    assert @log.item_quantity, value

    min_average_quantity_by_category = result[:min_average_quantity_by_category]
    key, value = min_average_quantity_by_category
    assert @log.item_category, key
    assert @log.item_quantity, value
  end

  test "months with no logs should return nil results" do
    report = Report.new
    result = report.generate_month_report(2021, 5) # There are no logs with 5th month

    max_quantity_log = result[:max_quantity_log]
    assert_nil max_quantity_log

    max_revenue_log = result[:max_revenue_log]
    assert_nil max_revenue_log

    max_average_quantity_by_brand = result[:max_average_quantity_by_brand]
    assert_nil max_average_quantity_by_brand

    max_average_quantity_by_category = result[:max_average_quantity_by_category]
    assert_nil max_average_quantity_by_category

    min_quantity_log = result[:min_quantity_log]
    assert_nil min_quantity_log

    min_revenue_log = result[:min_revenue_log]
    assert_nil min_revenue_log

    min_average_quantity_by_brand = result[:min_average_quantity_by_brand]
    assert_nil min_average_quantity_by_brand

    min_average_quantity_by_category = result[:min_average_quantity_by_category]
    assert_nil min_average_quantity_by_category
  end

  # ========================================
  # | generate_year_report method tests 
  # ========================================
  test "year report should be valid" do
    report = Report.new
    result = report.generate_year_report(2021)
    expected = {}
    empty_month_report = {:max_quantity_log=>nil, 
                          :max_revenue_log=>nil, 
                          :max_average_quantity_by_brand=>nil, 
                          :max_average_quantity_by_category=>nil, 
                          :min_quantity_log=>nil, 
                          :min_revenue_log=>nil, 
                          :min_average_quantity_by_brand=>nil, 
                          :min_average_quantity_by_category=>nil
                          }

    expected[:January] = empty_month_report 
    expected[:February] = report.generate_month_report(2021, 2)
    expected[:March] = empty_month_report
    expected[:April] = report.generate_month_report(2021, 4)
    expected[:May] = empty_month_report
    expected[:June] = report.generate_month_report(2021, 6)
    expected[:July] = empty_month_report
    expected[:August] = empty_month_report
    expected[:September] = empty_month_report
    expected[:October] = empty_month_report
    expected[:November] = empty_month_report
    expected[:December] = report.generate_month_report(2021, 12)

    assert_equal expected, result
  end

  test "months with no logs should contain empty month report" do
    report = Report.new
    result = report.generate_year_report(2021)
    expected = {}
    empty_month_report = {:max_quantity_log=>nil, 
                          :max_revenue_log=>nil, 
                          :max_average_quantity_by_brand=>nil, 
                          :max_average_quantity_by_category=>nil, 
                          :min_quantity_log=>nil, 
                          :min_revenue_log=>nil, 
                          :min_average_quantity_by_brand=>nil, 
                          :min_average_quantity_by_category=>nil
                          }

    assert_equal empty_month_report, result[:January]
    assert_equal empty_month_report, result[:March]
    assert_equal empty_month_report, result[:May]
    assert_equal empty_month_report, result[:July]
    assert_equal empty_month_report, result[:August]
    assert_equal empty_month_report, result[:September]
    assert_equal empty_month_report, result[:October]
    assert_equal empty_month_report, result[:November]

    
  end

end