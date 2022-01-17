require 'date'

class ReportsController < ApplicationController
    def index
        @report = Report.new.generate_inventory_report(params[:year].to_i)
    end 
    
end
