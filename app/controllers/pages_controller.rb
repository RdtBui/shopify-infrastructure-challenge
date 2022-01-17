require 'date'

class PagesController < ApplicationController
    # before_action :generate_report, only: [:report]
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
        # Most stocked item
        @log = max_quantity(2022, 1)

        # Most stocked brand
        @brand = max_quantity_by_brand(2022, 1) #[brand, total quantities]

        # Most stocked category

        # Highest total value item (price x quantity)
        @value = max_value(2022, 1) #log returned
        
        # Least stocked item

        # Least stocked brands

        # Least stocked categories

    end

    # Return item logs with highest quantities
    def max_quantity(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log.order(item_quantity: :desc).first
    end

    
    def max_quantity_by_brand(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        total_quantities = log.group("id").sum("item_quantity") # Total quantity per brand
        
        id, quantity = total_quantities.max_by{|k, v| v}

        return Log.find(id)
    end

    def max_quantity_by_category(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        total_quantities = log.group("item_category").sum("item_quantity") # Total quantity per category
        
        return total_quantities.max_by{|k, v| v}
    end

    def max_value(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        total_values = log.group("id").sum("item_quantity * item_price") # Total quantity per brand
        log_id, total_revenue = total_values.max_by{|k, v| v}

        return Log.find(log_id)
    end

    def min_quantity(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log.order(item_quantity: :asc).first
    end

    def min_quantity_by_brand(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        total_quantities = log.group("item_brand").sum("item_quantity") # Total quantity per brand
        
        return total_quantities.min_by{|k, v| v}
    end

    def min_quantity_by_category(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })
        
        total_quantities = log.group("item_category").sum("item_quantity") # Total quantity per category
        
        return total_quantities.min_by{|k, v| v}
    end
end
