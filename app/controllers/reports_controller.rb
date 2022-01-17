require 'date'

class ReportsController < ApplicationController
    def index
        @report = Report.new.generate_year_report(params[:year].to_i)
    end 
    
end
