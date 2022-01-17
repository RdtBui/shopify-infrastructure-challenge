require 'date'

class PagesController < ApplicationController

    def home

    end
    
    def report
        generate_inventory_report

    end 

    private
    
    def generate_monthly_report
        # @items = Item.where("created_at >= :start_date AND created_at <= :end_date", { start_date: params[:start_date], end_date: params[:end_date] })
        # @most_in_stock = most_in_stock(@items)
    end

    def generate_inventory_report
        year = 2022
        month = 1
        
        @max_quantity_log = max_quantity(year, month) # Most stocked item
        @max_quantity_by_brand_log = max_quantity_by_brand(year, month) # Most stocked brand        
        @max_quantity_by_category_log = max_quantity_by_category(year, month) # Most stocked category
        @max_revenue_log = max_revenue(year, month) # Highest revenue (price x quantity)
        @min_quantity_log = min_quantity(year, month) # Least stocked item
        @min_quantity_by_brand_log = min_quantity_by_brand(year, month) # Least stocked brands
        @min_quantity_by_category_log = min_quantity_by_category(year, month) # Least stocked categories
        @min_revenue_log = min_revenue(year, month) # Lowest revenue (price x quantity)

    end

    # Return item logs with highest quantities
    def max_quantity(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log.order(item_quantity: :desc).first
    end

    
    def max_quantity_by_brand(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_quantities = log.group("id").sum("item_quantity") # Total quantity per brand
        log_id, quantity = total_quantities.max_by(&:first)

        return Log.find(log_id)
    end

    def max_quantity_by_category(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_quantities = log.group("id").sum("item_quantity") # Total quantity per category
        log_id, quantity = total_quantities.max_by(&:first)
        
        return Log.find(log_id)
    end

    def max_revenue(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_values = log.group("id").sum("item_quantity * item_price") # Total quantity per brand
        log_id, revenue = total_values.max_by(&:first)

        return Log.find(log_id)
    end

    def min_quantity(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log.order(item_quantity: :asc).first
    end

    def min_quantity_by_brand(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_quantities = log.group("id").sum("item_quantity") # Total quantity per brand
        log_id, quantity = total_quantities.min_by(&:last)

        return Log.find(log_id)
    end

    def min_quantity_by_category(year, month)    
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_quantities = log.group("id").sum("item_quantity") # Total quantity per category
        log_id, quantity = total_quantities.min_by(&:last)

        return Log.find(log_id)
    end

    def min_revenue(year, month)
        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm
        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        total_values = log.group("id").sum("item_quantity * item_price") # Total quantity per brand
        log_id, revenue = total_values.min_by(&:last)

        return Log.find(log_id)
    end
end
