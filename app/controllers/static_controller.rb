class StaticController < ApplicationController
  def index
  	@count = Result.count
  	@start = ENV['sprint_start']
  	@stop = ENV['sprint_stop']
  	@last_index = Result.last.key if Result.last
  end
end
