require 'date'

class ReportsController < ApplicationController
  def index
    @year = if params[:year].nil?
              2021
            else
              params[:year].to_i
            end

    @report = Report.new.generate_year_report(@year)
  end
end
