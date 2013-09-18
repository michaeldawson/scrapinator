class ResultsController < ApplicationController
  def index
  	@results = Result.all

  	if params[:offset] && params[:size]
	  	respond_to do |format|
		    format.html
		    format.csv { send_data @results.to_csv(params[:offset].to_i, params[:size].to_i) }
		end
	end
  end
end
