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
        max_quantity_log = max_quantity(year, month) # Most stocked item
        max_average_quantity_by_brand = max_average_quantity_by_brand(year, month) # Most stocked brand        
        max_average_quantity_by_category = max_average_quantity_by_category(year, month) # Most stocked category
        max_revenue_log = max_revenue(year, month) # Highest revenue (price x quantity)
        min_quantity_log = min_quantity(year, month) # Least stocked item
        min_average_quantity_by_brand = min_average_quantity_by_brand(year, month) # Least stocked brands
        min_average_quantity_by_category = min_average_quantity_by_category(year, month) # Least stocked categories
        min_revenue_log = min_revenue(year, month) # Lowest revenue (price x quantity)

        report = { max_quantity_log: max_quantity_log,
                   max_revenue_log: max_revenue_log,
                   max_average_quantity_by_brand: max_average_quantity_by_brand,
                   max_average_quantity_by_category: max_average_quantity_by_category,
                   min_quantity_log: min_quantity_log,
                   min_revenue_log: min_revenue_log,
                   min_average_quantity_by_brand: min_average_quantity_by_brand,
                   min_average_quantity_by_category: min_average_quantity_by_category
        }

        return report
    end

    # Return item logs with highest quantities
    def max_quantity(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        if log.nil?
            return nil
        end
        
        return log.order(item_quantity: :desc).first
    end
    
    def max_revenue(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_values = log.group("id").sum("item_quantity * item_price") # Total quantity per brand
        log_id, revenue = total_values.max_by(&:first)

        if log_id.nil?
            return nil
        end
        
        return Log.find(log_id)
    end

    def max_average_quantity_by_brand(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        average_quantity_per_sku = log.group(:item_brand, :item_sku).average("item_quantity") # Total quantity per brand
        total_average_quantity_per_brand = {}
        
        # Sums the average quantity of each SKU, grouped by brand
        average_quantity_per_sku.each do |key, value|
            if total_average_quantity_per_brand[key[0]].nil?
                total_average_quantity_per_brand[key[0]] = value
            else
                total_average_quantity_per_brand[key[0]] += value
            end
        end

        total_average_quantity_per_brand.delete(nil)
        max = total_average_quantity_per_brand.max_by(&:first)
        
        return max
    end

    def max_average_quantity_by_category(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        average_quantity_per_sku = log.group(:item_category, :item_sku).average("item_quantity") # Total quantity per category
        total_average_quantity_per_category = {}

        # Sums the average quantity of each SKU, grouped by category
        average_quantity_per_sku.each do |key, value|
            if total_average_quantity_per_category[key[0]].nil?
                total_average_quantity_per_category[key[0]] = value
            else
                total_average_quantity_per_category[key[0]] += value
            end
        end

        total_average_quantity_per_category.delete(nil)
        max = total_average_quantity_per_category.max_by(&:first)
        
        return max
    end

    def min_quantity(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        if log.nil?
            return nil
        end

        return log.order(item_quantity: :asc).first
    end
    
    def min_revenue(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_values = log.group("id").sum("item_quantity * item_price") # Total quantity per brand
        log_id, revenue = total_values.min_by(&:last)

        if log_id.nil?
            return nil
        end
        
        return Log.find(log_id)
    end
    
    def min_average_quantity_by_brand(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        average_quantity_per_sku = log.group(:item_brand, :item_sku).average("item_quantity") # Total quantity per brand
        total_average_quantity_per_brand = {}
        
        # Sums the average quantity of each SKU, grouped by brand
        average_quantity_per_sku.each do |key, value|
            if total_average_quantity_per_brand[key[0]].nil?
                total_average_quantity_per_brand[key[0]] = value
            else
                total_average_quantity_per_brand[key[0]] += value
            end
        end

        total_average_quantity_per_brand.delete(nil)
        min = total_average_quantity_per_brand.min_by(&:last)
        
        return min
    end

    def min_average_quantity_by_category(year, month)    
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        average_quantity_per_sku = log.group(:item_category, :item_sku).average("item_quantity") # Total quantity per category
        total_average_quantity_per_category = {}

        # Sums the average quantity of each SKU, grouped by category
        average_quantity_per_sku.each do |key, value|
            if total_average_quantity_per_category[key[0]].nil?
                total_average_quantity_per_category[key[0]] = value
            else
                total_average_quantity_per_category[key[0]] += value
            end
        end

        total_average_quantity_per_category.delete(nil)
        min = total_average_quantity_per_category.min_by(&:last)
        
        return min
    end

end
