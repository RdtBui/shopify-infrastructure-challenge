require 'date'

class Report < ApplicationRecord
    def generate_inventory_report(year)
        months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
        report = {}

        months.each_with_index do |month,i|
            report[month] = generate_monthly_report(year, i + 1)
        end

        return report
    end

    private
    def generate_monthly_report(year, month)
        report = { max_quantity_log: max_quantity(year, month),
                   max_revenue_log: max_revenue(year, month),
                   max_average_quantity_by_brand: max_average_quantity_by_brand(year, month),
                   max_average_quantity_by_category: max_average_quantity_by_category(year, month),
                   min_quantity_log: min_quantity(year, month),
                   min_revenue_log: min_revenue(year, month),
                   min_average_quantity_by_brand: min_average_quantity_by_brand(year, month),
                   min_average_quantity_by_category: min_average_quantity_by_category(year, month)
        }

        return report
    end

    def max_quantity(year, month)
        log = get_month_log(year, month)
        max_item = min_max_quantity(log, true)
        return max_item
    end
    
    def max_revenue(year, month)
        log = get_month_log(year, month)
        max_item = min_max_revenue(log, true)
        return max_item
    end

    def max_average_quantity_by_brand(year, month)
        log = get_month_log(year, month)
        max = min_max_average_quantity_by_criteria(:item_brand, log, true)
        return max
    end
    
    
    def max_average_quantity_by_category(year, month)
        log = get_month_log(year, month)
        max = min_max_average_quantity_by_criteria(:item_category, log, true)
        return max
    end
    
    def min_quantity(year, month)
        log = get_month_log(year, month)
        min_item = min_max_quantity(log, false)
        return min_item
    end
    
    def min_revenue(year, month)
        log = get_month_log(year, month)
        min_item = min_max_revenue(log, false)
        return min_item
    end
    
    def min_average_quantity_by_brand(year, month)
        log = get_month_log(year, month)
        min = min_max_average_quantity_by_criteria(:item_brand, log, false)
        return min
    end
    
    def min_average_quantity_by_category(year, month)    
        log = get_month_log(year, month)
        min = min_max_average_quantity_by_criteria(:item_category, log, false)
        return min
    end
    
    def get_month_log(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log
    end

    def min_max_quantity(log, max=false) # true => returns max, false => returns min
        if log.nil?
            return nil
        end

        if max
            return log.order(item_quantity: :desc).first
        end

        return log.order(item_quantity: :asc).first
    end

    def min_max_revenue(log, max=false) # true => returns max, false => returns min
        total_values = log.group("id").sum("item_quantity * item_price")
        if max
            log_id, revenue = total_values.max_by(&:first)
        else
            log_id, revenue = total_values.min_by(&:last)
        end
        
        if log_id.nil?
            return nil
        end
        
        return Log.find(log_id)
    end
    
    def min_max_average_quantity_by_criteria(criteria, log, max = false) # true => returns max, false => returns min
        average_quantity_per_sku = log.group(criteria, :item_sku).average("item_quantity")
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
            return total_average_quantity_per_criteria.max_by(&:first)
        end
        
        return total_average_quantity_per_criteria.min_by(&:last)
    end
end