require 'date'

class PagesController < ApplicationController
    before_action :generate_report, only: [:report]
    def home
    end
    
    def report
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

    def most_in_stock(items, month, year)
        @most_in_stock_item = Item.where("created_at >= :start_date AND created_at <= :end_date", 
            { start_date: params[:start_date], end_date: params[:end_date] })

        @items.maximum("quantity")
    end
end
