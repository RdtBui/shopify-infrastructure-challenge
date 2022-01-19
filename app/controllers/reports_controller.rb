require 'date'

class ReportsController < ApplicationController
    def index
        if params[:year].nil?
            @year = 2021
        else
            @year = params[:year].to_i
        end

        @report = Report.new.generate_year_report(@year)
    end 
    
end
