class StaticController < ApplicationController
  def index
  	@count = Result.count
  end
end
