class PagesController < ApplicationController
    before_action :generate_report, only: [:report]
    def home
    end
    
    def report
    end 

    private
    def generate_report
        @items = Item.where("created_at >= :start_date AND created_at <= :end_date", { start_date: params[:start_date], end_date: params[:end_date] })
        @most_in_stock = most_in_stock(@items)

    end

    def most_in_stock(items)
        @items.maximum("quantity")
    end
end
