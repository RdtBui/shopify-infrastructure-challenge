require 'date'

class PagesController < ApplicationController
    # before_action :generate_report, only: [:report]
    def home
    end
    
    def report
        @log = most_in_stock(2022, 1)
    end 

    private
    
    def generate_monthly_report
        # @items = Item.where("created_at >= :start_date AND created_at <= :end_date", { start_date: params[:start_date], end_date: params[:end_date] })
        # @most_in_stock = most_in_stock(@items)
    end

    def generate_stock_report
        # Most stocked item 

        # Most stocked brand

        # Most stocked category

        # Highest total value item (price x quantity)
        
        # Least stocked item

        # Least stocked brands

        # Least stocked categories

    end

    def most_in_stock(year, month)
        # Handle error if exits

        start_date = DateTime.civil(year, month)
        end_date = DateTime.civil(year, month, -1, -1, -1) # Last day of the month, at 11:59 pm

        log = Log.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: start_date, end_date: end_date })

        return log.order("item_quantity DESC").first
    end
end
