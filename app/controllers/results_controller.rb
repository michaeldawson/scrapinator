class ResultsController < ApplicationController
  def index
  	@results = Result.all

  	respond_to do |format|
	    format.html
	    format.csv { send_data @results.to_csv }
	end
  end
end
