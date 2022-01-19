require 'date'

class Report < ApplicationRecord
  def generate_year_report(year)
    months = %i[January February March April May June July August September October November
                December]
    report = {}
    months.each_with_index do |month, i|
      report[month] = generate_month_report(year, i + 1)
    end
    report
  end

  def generate_month_report(year, month)
    { max_quantity_log: max_quantity(year, month),
      max_revenue_log: max_revenue(year, month),
      max_average_quantity_by_brand: max_average_quantity_by_brand(year, month),
      max_average_quantity_by_category: max_average_quantity_by_category(year, month),
      min_quantity_log: min_quantity(year, month),
      min_revenue_log: min_revenue(year, month),
      min_average_quantity_by_brand: min_average_quantity_by_brand(year, month),
      min_average_quantity_by_category: min_average_quantity_by_category(year, month) }
  end

  private

  def max_quantity(year, month)
    log = get_month_log(year, month)
    min_max_quantity(log, true)
  end

  def max_revenue(year, month)
    log = get_month_log(year, month)
    min_max_revenue(log, true)
  end

  def max_average_quantity_by_brand(year, month)
    log = get_month_log(year, month)
    min_max_average_quantity_by_criteria(:item_brand, log, true)
  end

  def max_average_quantity_by_category(year, month)
    log = get_month_log(year, month)
    min_max_average_quantity_by_criteria(:item_category, log, true)
  end

  def min_quantity(year, month)
    log = get_month_log(year, month)
    min_max_quantity(log, false)
  end

  def min_revenue(year, month)
    log = get_month_log(year, month)
    min_max_revenue(log, false)
  end

  def min_average_quantity_by_brand(year, month)
    log = get_month_log(year, month)
    min_max_average_quantity_by_criteria(:item_brand, log, false)
  end

  def min_average_quantity_by_category(year, month)
    log = get_month_log(year, month)
    min_max_average_quantity_by_criteria(:item_category, log, false)
  end

  def get_month_log(year, month)
    start_date = DateTime.civil(year, month)
    end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
    Log.where('created_at >= :start_date AND created_at <= :end_date',
              { start_date: start_date, end_date: end_date })
  end

  def min_max_quantity(log, max = false) # true => returns max, false => returns min
    if log.nil?
      nil
    elsif max
      log.order(item_quantity: :desc).first
    else # min
      log.order(item_quantity: :asc).first
    end
  end

  def min_max_revenue(log, max = false) # true => returns max, false => returns min
    total_values = log.group('id').sum('item_quantity * item_price')
    if max
      log_id, revenue = total_values.max_by(&:last)
    else # min
      log_id, revenue = total_values.min_by(&:last)
    end

    if log_id.nil?
      nil
    else
      Log.find(log_id)
    end
  end

  def min_max_average_quantity_by_criteria(criteria, log, max = false) # true => returns max, false => returns min
    average_quantity_per_sku = log.group(criteria, :item_sku).average('item_quantity')
    total_average_quantity_per_criteria = {}

    # Sums the average quantity of each SKU, grouped by the criteria
    average_quantity_per_sku.each do |key, value|
      if total_average_quantity_per_criteria[key[0]].nil?
        total_average_quantity_per_criteria[key[0]] = value
      else
        total_average_quantity_per_criteria[key[0]] += value
      end
    end

    total_average_quantity_per_criteria.delete(nil)

    if max
      total_average_quantity_per_criteria.max_by(&:first)
    else # min
      total_average_quantity_per_criteria.min_by(&:last)
    end
  end
end
