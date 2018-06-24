class ReportsController < ApplicationController
  
  include Reports
  
  def index
    respond_to do |format|
      format.html 
      format.json { render json: Reports.generate_report.to_json }
    end
  end
end
